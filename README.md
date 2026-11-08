# pfetch

**A lightweight system information fetch tool written in Perl.**

pfetch is a small, minimalist command-line utility designed to display essential system information directly in your terminal.

Inspired by tools like [pfetch](https://github.com/dylanaraps/pfetch) and [Fastfetch](https://github.com/fastfetch-cli/fastfetch), this project aims to provide a simple, customizable and lightweight alternative, with a focus on Linux systems.

The project is written in **Perl 5** and serves as both a practical system administration tool and a learning project.

![Perl Version](https://img.shields.io/badge/Perl-5.0%2B-blue)
![License](https://img.shields.io/badge/License-MIT-green)

## Project Status

🚧 **Work in Progress**

pfetch is currently under active development. Features, architecture and functionality may change as the project evolves.

The initial development target is Linux, with Arch-based distributions such as CachyOS serving as the primary testing environment.

## Planned Features

- Display essential system information
- Operating system and distribution detection
- Kernel and architecture information
- Hostname and shell detection
- CPU and memory information
- Minimalist ASCII art
- Colored terminal output
- Modular and maintainable architecture
- Command-line options
- Customizable themes and configuration

+ Added bash folder: This is just a small exercise in bash scripting. Goal is to generate an HTML report on all kinds of system information.

## Project Structure

The planned project structure:

```text
pfetch/
├── bin/
│   └── pfetch
├── lib/
│   └── PFetch/
│       ├── System.pm
│       ├── Hardware.pm
│       ├── Display.pm
│       └── Colors.pm
├── share/
│   └── logos/
├── t/
│   ├── system.t
│   └── display.t
├── README.md
├── LICENSE
└── Makefile
```

The project follows a modular approach, separating system information gathering, hardware detection and terminal presentation.

## Requirements

- Perl 5
- A Linux-based operating system
- A terminal emulator

The project initially aims to use Perl's core modules wherever possible to minimize external dependencies.

## Installation

Installation instructions will be added once the initial executable and project structure are implemented.

For now, you can clone the repository:

```bash
git clone https://github.com/DanielBretschneider/pfetch.git
cd pfetch
```

## Usage

Usage instructions and available command-line options will be documented as functionality is implemented.

The intended interface is:

```bash
pfetch
pfetch --help
pfetch --version
```

## Development

pfetch is developed incrementally, with a focus on:

- Readable and maintainable Perl code
- Separation of responsibilities
- Minimal external dependencies
- Linux compatibility
- Reliable system information detection

Contributions, suggestions and feedback are welcome!

## License

This project is licensed under the terms of the [MIT License](LICENSE).

---

**Author:** [Daniel Bretschneider](https://github.com/DanielBretschneider)

**Email:** [daniel@bretschneider.cc](mailto:daniel@bretschneider.cc)

**Repository:** [github.com/DanielBretschneider/pfetch](https://github.com/DanielBretschneider/pfetch)
