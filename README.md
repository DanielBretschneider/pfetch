# pfetch

> Display your system specs with style using Perl. A fastfetch-inspired CLI utility for Unix-like systems.

![Perl Version](https://img.shields.io/badge/Perl-5.0%2B-blue)
![License](https://img.shields.io/badge/License-MIT-green)

## ✨ Features

*   **Written in Perl**: A clean, modern implementation distinct from Python-based clones.
*   **Fast & Lightweight**: Minimal dependencies for quick startup times.
*   **Customizable**: Easy to modify themes, colors, and output formats.
*   **Cross-Platform**: Works on Linux, BSD, macOS (via WSL or native support).
*   **Learning**: This is just for me learning.

## 🛠 Installation

Clone the repository and ensure you have Perl 5.10+ installed.

```bash
git clone https://github.com/yourusername/pfetch.git
cd pfetch
```

To run directly:
```bash
perl bin/fastfetch.pl
```

Or install it to your system path (optional):
```bash
sudo mv bin/fastfetch.pl /usr/local/bin/pfetch
chmod +x /usr/local/bin/pfetch
```

## 🚀 Usage

Run the tool with no arguments for default output:
```bash
pfetch
```

Use flags to customize behavior:
```bash
# Show help
pfetch --help

# Verbose output
pfetch -v

# Custom color scheme (placeholder)
pfetch --theme dark
```

## 📁 Project Structure

This project follows a modular structure for maintainability:

```text
pfetch/
├── bin/
│   └── fastfetch.pl    # Main executable entry point
├── lib/
│   └── FastFetch.pm    # Core logic and fetchers
├── themes/             # Color theme configurations
└── README.md
```

## 🤝 Author

Hi! This is me, Daniel Bretschneider, from Vienna. Feel free to contact me via daniel@bretschneider.cc. 

Also please visit my website at https://www.bretschneider.cc/

