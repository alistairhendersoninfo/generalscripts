# General Scripts

Collection of small utilities and examples. This repository now also contains
`pdf_to_text`, a simple Python wrapper around the `poppler-utils` commands such
as `pdftotext`.

## specification-kit

`specification-kit` is a scaffold for starting a documentation repository
focused on technical specifications. It includes a README-driven overview along
with placeholder directories for templates, examples, guides, and tooling so
teams can jumpstart a consistent spec workflow. See
[`specification-kit/README.md`](specification-kit/README.md) for details.

See `pdf_to_text/README.md` for details.

## lsx

`lsx` is a small wrapper around `ls` for small screens. When run with the `-l`
option it hides the permissions column while preserving other `ls` behaviour.
Other options are forwarded directly to `ls`.

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
