PHP_CodeSniffer 4.x requires PHP 7.2.0 or greater.
_Prior to PHP_CodeSniffer 4.0.0, the minimum PHP requirement was 5.4.0._

Additionally, PHP_CodeSniffer requires the following PHP extensions to be enabled:
- [Tokenizer][tokenizer]: used by the core tokenizer to process PHP files
- [SimpleXML][simplexml]: used to process ruleset XML files
- [XMLWriter][xmlwriter]: used to create some report formats

The following PHP extensions are not required, but are strongly recommended:
- [iconv]: used for accurate character length calculation in files containing multibyte characters. Without this extension, some sniffs, like `Generic.Files.LineLength`, may report incorrect results for lines containing non-ASCII characters, as PHP_CodeSniffer will fall back to byte-based length calculations.
- [PCNTL][pcntl]: required for parallel processing via the `--parallel` CLI option. Without this extension, PHP_CodeSniffer will not be able to check multiple files simultaneously.

Individual sniffs may have additional requirements such as external applications and scripts. See the [Configuration Options](https://github.com/PHPCSStandards/PHP_CodeSniffer/wiki/Configuration-Options) manual page for a list of these requirements.

> [!WARNING]
> The [gRPC PHP extension][grpc] is known to cause PHP_CodeSniffer to hang when running with parallel processing enabled. If the gRPC extension is loaded, either do not use the `--parallel` CLI option or configure the extension's ini settings as follows:
> ```text
> phpcs -d grpc.enable_fork_support=1 -d grpc.poll_strategy=epoll1 [other options] <file|directory>
> ```

[grpc]:      https://grpc.io/docs/languages/php/
[iconv]:     https://www.php.net/book.iconv
[pcntl]:     https://www.php.net/book.pcntl
[simplexml]: https://www.php.net/book.simplexml
[tokenizer]: https://www.php.net/book.tokenizer
[xmlwriter]: https://www.php.net/book.xmlwriter
