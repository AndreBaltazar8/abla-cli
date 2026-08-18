# abla-cli

Typed command trees and generated help for command-line applications written in Abla.

```abla
import github("AndreBaltazar8/abla-cli")

val app = $cli {"hello", "1.0.0", "A small example", [], [
    cliCommand("greet", "Greet somebody", [], [
        cliFlag("loud", "--loud", "-l", "Use uppercase output")
    ], [cliArgument("name", "Person to greet")])
]}

val match = app.parseProcess()
```

`CliApp` provides nested commands, aliases, global and persistent options,
long and short flags, `--option=value`, `--`, defaults, required values,
choice validation, required/optional/variadic arguments, generated help and
version output, and structured `CliMatch` results. The `$cli` subparser builds
the same typed tree at compile time, so applications keep their command schema
beside their code rather than maintaining a second usage string.

Run `make test` with a current Abla compiler checkout in `../ablac`.
