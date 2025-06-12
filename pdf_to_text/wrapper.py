import subprocess
from typing import List, Optional


def run_poppler_util(command: str, pdf_path: str, output_path: Optional[str] = None, options: Optional[List[str]] = None) -> str:
    """Run a poppler utility command and return its stdout.

    Parameters
    ----------
    command: str
        Name of the poppler utility (e.g. ``pdftotext``, ``pdftohtml``).
    pdf_path: str
        Path to the PDF file to process.
    output_path: Optional[str]
        Optional path for the output file. If ``None`` the command's stdout is captured.
    options: Optional[List[str]]
        Additional command line options as a list.

    Returns
    -------
    str
        The stdout produced by the command.
    """
    if options is None:
        options = []

    cmd = [command] + options + [pdf_path]
    if output_path:
        cmd.append(output_path)

    result = subprocess.run(cmd, capture_output=True, text=True, check=True)
    return result.stdout
