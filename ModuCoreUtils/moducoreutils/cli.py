"""Modular CLI loader for ModuCoreUtils."""

from importlib import import_module
from pkgutil import iter_modules


def discover_modules():
    package = import_module('moducoreutils.modules')
    modules = []
    for _, name, ispkg in iter_modules(package.__path__):
        if ispkg:
            mod = import_module(f'moducoreutils.modules.{name}')
            if hasattr(mod, 'CLI_NAME') and hasattr(mod, 'run'):
                modules.append((mod.CLI_NAME, mod.run))
    return modules


def main():
    modules = discover_modules()
    while True:
        print("\nModuCoreUtils Menu:")
        for idx, (name, _) in enumerate(modules, start=1):
            print(f" {idx}. {name}")
        print(" 0. Exit")
        choice = input("Select an option: ")
        if choice.strip() == '0':
            break
        try:
            index = int(choice) - 1
            _, action = modules[index]
            action()
        except (ValueError, IndexError):
            print("Invalid selection")

if __name__ == '__main__':
    main()
