## Table of contents

<!-- START doctoc -->
<!-- END doctoc -->

***

## Getting Help from the Command Line

Running PHP_CodeSniffer with the `-h` or `--help` command line arguments will print a list of commands that PHP_CodeSniffer will respond to. The output of `phpcs -h` is shown below.

```text
Usage:
  phpcs [options] <file|directory>

Scan targets:
  <file|directory>               One or more files and/or directories to check, space separated.
  -                              Check STDIN instead of local files and directories.
  --stdin-path=<stdinPath>       If processing STDIN, the file path that STDIN will be processed as.
  --file-list=<fileList>         Check the files and/or directories which are defined in the file to which the
                                 path is provided (one per line).
  --filter=<filter>              Check based on a predefined file filter. Use either the "GitModified" or
                                 "GitStaged" filter, or specify the path to a custom filter class.
  --ignore=<patterns>            Ignore files based on a comma-separated list of patterns matching files
                                 and/or directories.
  --extensions=<extensions>      Check files with the specified file extensions (comma-separated list).
                                 Defaults to php,inc/php,js,css.
                                 The type of the file can be specified using: ext/type; e.g. module/php,es/js.
  -l                             Check local directory only, no recursion.

Rule Selection Options:
  --standard=<standard>          The name of, or the path to, the coding standard to use. Can be a
                                 comma-separated list specifying multiple standards. If no standard is
                                 specified, PHP_CodeSniffer will look for a [.]phpcs.xml[.dist] custom ruleset
                                 file in the current directory and those above it.
  --sniffs=<sniffs>              A comma-separated list of sniff codes to limit the scan to. All sniffs must
                                 be part of the standard in use.
  --exclude=<sniffs>             A comma-separated list of sniff codes to exclude from the scan. All sniffs
                                 must be part of the standard in use.

  -i                             Show a list of installed coding standards.
  -e                             Explain a standard by showing the names of all the sniffs it includes.
  --generator=<generator>        Show documentation for a standard. Use either the "HTML", "Markdown" or
                                 "Text" generator.

Run Options:
  -a                             Run in interactive mode, pausing after each file.
  --bootstrap=<bootstrap>        Run the specified file(s) before processing begins. A list of files can be
                                 provided, separated by commas.
  --cache[=<cacheFile>]          Cache results between runs. Optionally, <cacheFile> can be provided to use a
                                 specific file for caching. Otherwise, a temporary file is used.
  --no-cache                     Do not cache results between runs (default).
  --parallel=<processes>         The number of files to be checked simultaneously. Defaults to 1 (no parallel
                                 processing).
                                 If enabled, this option only takes effect if the PHP PCNTL (Process Control)
                                 extension is available.

  -d <key[=value]>               Set the [key] php.ini value to [value] or set to [true] if value is omitted.
                                 Note: only php.ini settings which can be changed at runtime are supported.

Reporting Options:
  --report=<report(s)>           A comma-separated list of reports to print. Available reports: "full", "xml",
                                 "checkstyle", "csv", "json", "junit", "emacs", "source", "summary", "diff",
                                 "svnblame", "gitblame", "hgblame", "notifysend" or "performance".
                                 Or specify the path to a custom report class. By default, the "full" report
                                 is displayed.
  --report-file=<reportFile>     Write the report to the specified file path.
  --report-<report>=<reportFile> Write the report specified in <report> to the specified file path.
  --report-width=<reportWidth>   How many columns wide screen reports should be. Set to "auto" to use current
                                 screen width, where supported.
  --basepath=<basepath>          Strip a path from the front of file paths inside reports.

  -w                             Include both warnings and errors (default).
  -n                             Do not include warnings. Shortcut for "--warning-severity=0".
  --severity=<severity>          The minimum severity required to display an error or warning. Defaults to 5.
  --error-severity=<severity>    The minimum severity required to display an error. Defaults to 5.
  --warning-severity=<severity>  The minimum severity required to display a warning. Defaults to 5.

  -s                             Show sniff error codes in all reports.
  --ignore-annotations           Ignore all "phpcs:..." annotations in code comments.
  --colors                       Use colors in screen output.
  --no-colors                    Do not use colors in screen output (default).
  -p                             Show progress of the run.
  -q                             Quiet mode; disables progress and verbose output.
  -m                             Stop error messages from being recorded. This saves a lot of memory but stops
                                 many reports from being used.

Configuration Options:
  --encoding=<encoding>          The encoding of the files being checked. Defaults to "utf-8".
  --tab-width=<tabWidth>         The number of spaces each tab represents.

  Default values for a selection of options can be stored in a user-specific CodeSniffer.conf configuration
  file.
  This applies to the following options: "default_standard", "report_format", "tab_width", "encoding",
  "severity", "error_severity", "warning_severity", "show_warnings", "report_width", "show_progress", "quiet",
  "colors", "cache", "parallel", "installed_paths", "php_version", "ignore_errors_on_exit",
  "ignore_warnings_on_exit".
  --config-show                  Show the configuration options which are currently stored in the applicable
                                 CodeSniffer.conf file.
  --config-set <key> <value>     Save a configuration option to the CodeSniffer.conf file.
  --config-delete <key>          Delete a configuration option from the CodeSniffer.conf file.
  --runtime-set <key> <value>    Set a configuration option to be applied to the current scan run only.

Miscellaneous Options:
  -h, -?, --help                 Print this help message.
  --version                      Print version information.
  -v                             Verbose output: Print processed files.
  -vv                            Verbose output: Print ruleset and token output.
  -vvv                           Verbose output: Print sniff processing information.
```

> [!NOTE]
> The `--standard` command line argument is optional, even if you have more than one coding standard installed. If no coding standard is specified, PHP_CodeSniffer will default to checking against the _PEAR_ coding standard, or the standard you have set as the default. [View instructions for setting the default coding standard](https://github.com/PHPCSStandards/PHP_CodeSniffer/wiki/Configuration-Options#setting-the-default-coding-standard).

<p align="right"><a href="#table-of-contents">back to top</a></p>


## Checking Files and Folders

The most straight-forward way of using PHP_CodeSniffer is to provide the location of a file or folder for PHP_CodeSniffer to check. If a folder is provided, PHP_CodeSniffer will check all files it finds in that folder and all its sub-folders. If you do not want sub-folders checked, use the `-l` command line argument to force PHP_CodeSniffer to run locally in the folders specified.

In the example below, the first command tells PHP_CodeSniffer to check the `myfile.inc` file for coding standard errors while the second command tells PHP_CodeSniffer to check all PHP files in the `my_dir` directory.

```bash
$ phpcs /path/to/code/myfile.inc
$ phpcs /path/to/code/my_dir
```

You can also specify multiple files and folders to check. The command below tells PHP_CodeSniffer to check the `myfile.inc` file and all files in the `my_dir` directory.

```bash
$ phpcs /path/to/code/myfile.inc /path/to/code/my_dir
```

After PHP_CodeSniffer has finished processing your files, you will get an error report. The report lists both errors and warnings for all files that violated the coding standard. The output looks like this:

```bash
$ phpcs /path/to/code/myfile.php

FILE: /path/to/code/myfile.php
--------------------------------------------------------------------------------
FOUND 5 ERROR(S) AND 1 WARNING(S) AFFECTING 5 LINE(S)
--------------------------------------------------------------------------------
  2 | ERROR   | Missing file doc comment
 20 | ERROR   | PHP keywords must be lowercase; expected "false" but found
    |         | "FALSE"
 47 | ERROR   | Line not indented correctly; expected 4 spaces but found 1
 47 | WARNING | Equals sign not aligned with surrounding assignments
 51 | ERROR   | Missing function doc comment
 88 | ERROR   | Line not indented correctly; expected 9 spaces but found 6
--------------------------------------------------------------------------------
```

If you don't want warnings included in the output, specify the `-n` command line argument.

```bash
$ phpcs -n /path/to/code/myfile.php

FILE: /path/to/code/myfile.php
--------------------------------------------------------------------------------
FOUND 5 ERROR(S) AFFECTING 5 LINE(S)
--------------------------------------------------------------------------------
  2 | ERROR | Missing file doc comment
 20 | ERROR | PHP keywords must be lowercase; expected "false" but found "FALSE"
 47 | ERROR | Line not indented correctly; expected 4 spaces but found 1
 51 | ERROR | Missing function doc comment
 88 | ERROR | Line not indented correctly; expected 9 spaces but found 6
--------------------------------------------------------------------------------
```

<p align="right"><a href="#table-of-contents">back to top</a></p>


## Printing a Summary Report

By default, PHP_CodeSniffer will print a complete list of all errors and warnings it finds. This list can become quite long, especially when checking a large number of files at once. To print a summary report that only shows the number of errors and warnings for each file, use the `--report=summary` command line argument. The output will look like this:

```bash
$ phpcs --report=summary /path/to/code

PHP CODE SNIFFER REPORT SUMMARY
--------------------------------------------------------------------------------
FILE                                                            ERRORS  WARNINGS
--------------------------------------------------------------------------------
/path/to/code/myfile.inc                                        5       0
/path/to/code/yourfile.inc                                      1       1
/path/to/code/ourfile.inc                                       0       2
--------------------------------------------------------------------------------
A TOTAL OF 6 ERROR(S) AND 3 WARNING(S) WERE FOUND IN 3 FILE(S)
--------------------------------------------------------------------------------
```

As with the full report, you can suppress the printing of warnings with the `-n` command line argument.

```bash
$ phpcs -n --report=summary /path/to/code

PHP CODE SNIFFER REPORT SUMMARY
--------------------------------------------------------------------------------
FILE                                                                      ERRORS
--------------------------------------------------------------------------------
/path/to/code/myfile.inc                                                  5
/path/to/code/yourfile.inc                                                1
--------------------------------------------------------------------------------
A TOTAL OF 6 ERROR(S) WERE FOUND IN 2 FILE(S)
--------------------------------------------------------------------------------
```

<p align="right"><a href="#table-of-contents">back to top</a></p>


## Printing Progress Information

By default, PHP_CodeSniffer will run quietly, only printing the report of errors and warnings at the end. If you are checking a large number of files, you may have to wait a while to see the report. If you want to know what is happening, you can turn on progress or verbose output.

To enable progress reporting, use the `-p` command line argument.
With progress output enabled, PHP_CodeSniffer will print a single-character status for each file being checked, like so:

```bash
$ phpcs /path/to/code/CodeSniffer -p

...S........W.........S.....................................  60 / 110 (54%)
..........EEEE.E.E.E.E.E.E.E.E..W..EEE.E.E.E.EE.E.           110 / 110 (100%)
```

Legend for the progress indicators:

| When scanning with | Indicator    | Means:                                                    |
| ------------------ | ------------ | --------------------------------------------------------- |
| `phpcs`            | `E` (red)    | Non-fixable error(s) found in the file                    |
|                    | `E` (green)  | Fixable error(s) found in the file                        |
|                    | `W` (yellow) | Non-fixable warning(s) found in the file, but no errors   |
|                    | `W` (green)  | Fixable warning(s) found in the file, but no errors       |
| `phpcbf`           | `F` (green)  | Fixed errors and/or warnings in the file                  |
|                    | `E` (red)    | Unfixable errors or warnings in the file (fixer conflict) |
| `phpcs`/`phpcbf`   | `.`          | No errors or warnings found in the file                   |
|                    | `S`          | File was skipped                                          |

> [!NOTE]
> You can configure PHP_CodeSniffer to show progress information by default using [the `show_progress` configuration option](https://github.com/PHPCSStandards/PHP_CodeSniffer/wiki/Configuration-Options#showing-progress-by-default)</link>.

With verbose output enabled, PHP_CodeSniffer will print the file that it is checking, show you how many tokens and lines the file contains, and let you know how long it took to process. The output will look like this:

```bash
$ phpcs /path/to/code/CodeSniffer -v

Registering sniffs in PEAR standard... DONE (28 sniffs registered)
Creating file list... DONE (158 files in queue)
Changing into directory src/Standards/Generic/Sniffs/Arrays
Processing ArrayIndentSniff.php [1409 tokens in 193 lines]... DONE in 39ms (4 errors, 20 warnings)
Processing DisallowLongArraySyntaxSniff.php [405 tokens in 72 lines]... DONE in 11ms (0 errors, 4 warnings)
Processing DisallowShortArraySyntaxSniff.php [331 tokens in 61 lines]... DONE in 9ms (4 errors, 3 warnings)
Changing into directory src/Standards/Generic/Sniffs/Classes
Processing DuplicateClassNameSniff.php [800 tokens in 118 lines]... DONE in 24ms (0 errors, 0 warnings)
Processing OpeningBraceSameLineSniff.php [936 tokens in 123 lines]... DONE in 26ms (4 errors, 12 warnings)
...
```

<p align="right"><a href="#table-of-contents">back to top</a></p>


## Specifying a Coding Standard

PHP_CodeSniffer can have multiple coding standards installed to allow a single installation to be used with multiple projects. When checking PHP code, PHP_CodeSniffer can be told which coding standard to use. This is done using the `--standard` command line argument.

The example below checks the `myfile.inc` file for violations against the _PEAR_ coding standard (installed by default).

```bash
$ phpcs --standard=PEAR /path/to/code/myfile.inc
```

You can also tell PHP_CodeSniffer to use an external standard by specifying the full path to the standard's root directory on the command line. An external standard is one that is stored outside of PHP_CodeSniffer's `Standards` directory.

```bash
$ phpcs --standard=/path/to/MyStandard /path/to/code/myfile.inc
```

Multiple coding standards can be checked at the same time by passing a list of comma separated standards on the command line. A mix of external and installed coding standards can be passed if required.

```bash
$ phpcs --standard=PEAR,Squiz,/path/to/MyStandard /path/to/code/myfile.inc
```

<p align="right"><a href="#table-of-contents">back to top</a></p>


## Printing a List of Installed Coding Standards

PHP_CodeSniffer can print you a list of the coding standards that are installed so that you can correctly specify a coding standard to use for testing. You can print this list by specifying the `-i` command line argument.

```bash
$ phpcs -i
The installed coding standards are MySource, PEAR, PSR1, PSR2, PSR12, Squiz and Zend
```

<p align="right"><a href="#table-of-contents">back to top</a></p>


## Listing Sniffs Inside a Coding Standard

PHP_CodeSniffer can print you a list of the sniffs that a coding standard includes by specifying the `-e` (="explain") command line argument along with the `--standard` argument. This allows you to see what checks will be applied when you use a given standard.

```bash
$ phpcs --standard=PSR1 -e

The PSR1 standard contains 8 sniffs

Generic (4 sniffs)
------------------
  Generic.Files.ByteOrderMark
  Generic.NamingConventions.UpperCaseConstantName
  Generic.PHP.DisallowAlternativePHPTags
  Generic.PHP.DisallowShortOpenTag

PSR1 (3 sniffs)
---------------
  PSR1.Classes.ClassDeclaration
  PSR1.Files.SideEffects
  PSR1.Methods.CamelCapsMethodName

Squiz (1 sniff)
---------------
  Squiz.Classes.ValidClassName
```

<p align="right"><a href="#table-of-contents">back to top</a></p>
