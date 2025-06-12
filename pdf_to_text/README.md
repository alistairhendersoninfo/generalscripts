# PDF-to-text

Simple Python wrapper around `poppler-utils` commands such as `pdftotext` and
`pdftohtml`. The module exposes `run_poppler_util` which forwards options to the
underlying command and returns its standard output without modification.

## Requirements
- `poppler-utils` must be installed on the host system.
- Python 3.8+

No external Python packages are required.

## Usage

```python
from pdf_to_text import run_poppler_util

# Example: get text from a PDF using pdftotext
output = run_poppler_util('pdftotext', 'document.pdf', options=['-layout', '-'])
print(output)
```

Additional options such as `-htmlmeta`, `-xml`, or others can be supplied via the
`options` argument. Anything printed by the underlying command is returned
verbatim.
