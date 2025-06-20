"""Simple modular menu loader for ModuCore."""

from importlib import import_module
from pkgutil import iter_modules


def discover_modules():
    module_pkg = import_module('moducore.modules')
    discovered = []
    for _, name, ispkg in iter_modules(module_pkg.__path__):
        if ispkg:
            mod = import_module(f'moducore.modules.{name}')
            if hasattr(mod, 'MENU_NAME') and hasattr(mod, 'run'):
                discovered.append((mod.MENU_NAME, mod.run))
    return discovered


def main():
    modules = discover_modules()
    while True:
        print("\nModuCore Menu:")
        for idx, (menu_name, _) in enumerate(modules, start=1):
            print(f" {idx}. {menu_name}")
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
