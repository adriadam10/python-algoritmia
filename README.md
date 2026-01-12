# Paquete AUR para python-algoritmia

Este repo contiene los archivos necesarios para publicar y mantener el paquete `python-algoritmia` en [AUR (Arch User Repository)](https://aur.archlinux.org/).

Este paquete se basa en el paquete de Python [algoritmia](https://github.com/DavidLlorens/algoritmia) desarrollado por [David Llorens](https://github.com/DavidLlorens).

## ¿Qué es AUR?

AUR es el repositorio de la comunidad de Arch Linux. Permite a los usuarios de Arch instalar este paquete fácilmente con:

```bash
yay -S python-algoritmia
# o con cualquier otro AUR helper
```

## Archivos

| Archivo              | Descripción                                        |
|----------------------|----------------------------------------------------|
| `PKGBUILD`           | Receta de construcción del paquete para Arch Linux |
| `update-pkgbuild.sh` | Script para actualizar versión y checksum          |

## Automatización

El workflow [publish-aur.yml](.github/workflows/publish-aur.yml) automatiza la publicación en AUR cuando hay nuevas versiones en PyPI.

## Probar Localmente (solo Arch Linux)

```bash
# 1. Actualizar PKGBUILD con la versión actual de PyPI
VERSION=$(curl -s https://pypi.org/pypi/algoritmia/json | jq -r .info.version)
curl -sLO "https://files.pythonhosted.org/packages/source/a/algoritmia/algoritmia-${VERSION}.tar.gz"
SHA256=$(sha256sum algoritmia-${VERSION}.tar.gz | cut -d' ' -f1)
./update-pkgbuild.sh "$VERSION" "$SHA256"
rm algoritmia-${VERSION}.tar.gz

# 2. Construir el paquete
makepkg -d

# 3. Instalar localmente (opcional)
sudo pacman -U python-algoritmia-*.pkg.tar.zst
```
