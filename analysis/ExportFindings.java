// Export decompilation only for owned lab functions.
// @category ReverseEngineeringLab
import ghidra.app.script.GhidraScript;
import ghidra.app.decompiler.DecompInterface;
import ghidra.app.decompiler.DecompileResults;
import ghidra.program.model.listing.Function;
import ghidra.program.model.listing.FunctionIterator;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Set;

public class ExportFindings extends GhidraScript {
    @Override
    public void run() throws Exception {
        String[] args = getScriptArgs();
        if (args.length != 1) throw new IllegalArgumentException("expected output path");
        Set<String> selected = Set.of("check_token", "legacy_accept", "fixed_accept");
        DecompInterface decompiler = new DecompInterface();
        StringBuilder out = new StringBuilder("// Ghidra " +
            ghidra.framework.Application.getApplicationVersion() + "\n");
        int exported = 0;
        try {
            if (!decompiler.openProgram(currentProgram)) {
                throw new IllegalStateException("could not open program");
            }
            FunctionIterator functions = currentProgram.getFunctionManager().getFunctions(true);
            while (functions.hasNext()) {
                Function function = functions.next();
                if (!selected.contains(function.getName())) continue;
                DecompileResults result = decompiler.decompileFunction(function, 30, monitor);
                if (!result.decompileCompleted() || result.getDecompiledFunction() == null) {
                    throw new IllegalStateException("decompilation failed: " + function.getName());
                }
                out.append("\n// ").append(function.getName()).append(" @ ")
                    .append(function.getEntryPoint()).append("\n")
                    .append(result.getDecompiledFunction().getC());
                exported++;
            }
            int expected = currentProgram.getName().equals("token_gate") ? 1 : 2;
            if (exported != expected) throw new IllegalStateException("missing lab functions");
            String normalized = out.toString().replaceAll("(?m)[ \\t]+$", "").strip() + "\n";
            Files.writeString(Paths.get(args[0]), normalized, StandardCharsets.UTF_8);
        } finally {
            decompiler.dispose();
        }
    }
}
