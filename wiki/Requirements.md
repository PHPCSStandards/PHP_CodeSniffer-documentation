PHP_CodeSniffer 4.x requires PHP 7.2.0 or greater.  
_Prior to PHP_CodeSniffer 4.0.0, the minimum PHP requirement was 5.4.0._

Additionally, PHP_CodeSniffer requires the following PHP extensions to be enabled:
- Tokenizer: used by the core tokenizer to process PHP files
- SimpleXML: used to process ruleset XML files
- XMLWriter: used to create some report formats

The following PHP extensions are not required, but are strongly recommended:
- iconv: used for accurate character length calculation in files containing multibyte characters. Without this extension, some sniffs, like `Generic.Files.LineLength`, may report incorrect results for lines containing non-ASCII characters, as PHP_CodeSniffer will fall back to byte-based length calculations.
- PCNTL: required for parallel processing via the `--parallel` CLI option. Without this extension, PHP_CodeSniffer will not be able to check multiple files simultaneously.

> [!WARNING]
> The gRPC PHP extension is known to cause PHP_CodeSniffer to hang when running with parallel processing enabled. If the gRPC extension is loaded, make sure the `grpc.enable_fork_support` and `grpc.poll_strategy` ini settings are properly configured. See [this comment](https://github.com/PHPCSStandards/PHP_CodeSniffer/issues/294#issuecomment-1906558549) for more details.

Individual sniffs may have additional requirements such as external applications and scripts. See the [Configuration Options](https://github.com/PHPCSStandards/PHP_CodeSniffer/wiki/Configuration-Options) manual page for a list of these requirements.
