# General Scripts

Collection of small utilities and examples. This repository now also contains
`pdf_to_text`, a simple Python wrapper around the `poppler-utils` commands such
as `pdftotext`.

See `pdf_to_text/README.md` for details.

## lsx

`lsx` is a lightweight listing helper built on `find`.  It omits the
permissions, owner and group columns so the output fits better on small
screens.  When used with `-l` it prints only the file size and name.  Options
`-t` and `-r` control sorting by modification time and reversal respectively
and `-h` makes the reported size human readable.

Example usage:

```bash
$ lsx -ltrh
```

### Installation

Run the installer script with superuser permissions (installs to
`/usr/local/bin` by default):

```bash
sudo ./install_lsx.sh
```

Specify a different directory by providing a path:

```bash
sudo ./install_lsx.sh /opt/bin
```
