# Paquetes AUR para python-algoritmia

Este repo contiene los archivos necesarios para publicar y mantener los paquetes `python-algoritmia` y `python-easypaint` en [AUR (Arch User Repository)](https://aur.archlinux.org/).

Ambos paquetes se basan en librerías desarrolladas por [David Llorens](https://github.com/DavidLlorens):

- [algoritmia](https://github.com/DavidLlorens/algoritmia) - Librería de algoritmos y estructuras de datos
- [easypaint](https://github.com/DavidLlorens/easypaint) - Biblioteca de dibujo para Python 3

## ¿Qué es AUR?

AUR es el repositorio de la comunidad de Arch Linux. Permite a los usuarios de Arch instalar estos paquetes fácilmente con:

```bash
yay -S python-algoritmia python-easypaint
# o con cualquier otro AUR helper
```

## Archivos

| Directorio       | Descripción                            |
|------------------|----------------------------------------|
| `aur/`           | PKGBUILD para python-algoritmia        |
| `aur-easypaint/` | PKGBUILD para python-easypaint         |

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
