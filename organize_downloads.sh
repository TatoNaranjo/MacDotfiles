#!/bin/bash

# --- Script para Organizar Archivos y Carpetas en Descargas ---
# Versión 2: Clasifica archivos sueltos y agrupa las carpetas restantes.

# Directorio de origen
SOURCE_DIR="$HOME/Downloads"

# --- Definición de las Carpetas de Destino ---
DEST_BASE_DIR="$HOME/Downloads/Organized"

# Categorías para Archivos
DOCUMENTS_DIR="$DEST_BASE_DIR/Documentos"
CODE_DIR="$DEST_BASE_DIR/Codigo"
DATASETS_DIR="$DEST_BASE_DIR/Datasets"
IMAGES_DIR="$DEST_BASE_DIR/Imagenes"
AUDIO_DIR="$DEST_BASE_DIR/Audio"
VIDEO_DIR="$DEST_BASE_DIR/Video"
PRESENTATIONS_DIR="$DEST_BASE_DIR/Presentaciones"
COMPRESSED_DIR="$DEST_BASE_DIR/Comprimidos"
INSTALLERS_DIR="$DEST_BASE_DIR/Instaladores"
OTHER_DIR="$DEST_BASE_DIR/Otros"

# Carpeta para agrupar otros directorios
OTHER_FOLDERS_DIR="$DEST_BASE_DIR/Otras_Carpetas"

# --- Creación de Directorios ---
echo "📂 Creando directorios de destino si no existen..."
mkdir -p "$DOCUMENTS_DIR"
mkdir -p "$CODE_DIR"
mkdir -p "$DATASETS_DIR"
mkdir -p "$IMAGES_DIR"
mkdir -p "$AUDIO_DIR"
mkdir -p "$VIDEO_DIR"
mkdir -p "$PRESENTATIONS_DIR"
mkdir -p "$COMPRESSED_DIR"
mkdir -p "$INSTALLERS_DIR"
mkdir -p "$OTHER_DIR"
mkdir -p "$OTHER_FOLDERS_DIR"

# --- Bucle de Organización ---
echo "🚀 Iniciando la organización de archivos y carpetas en $SOURCE_DIR..."
for item in "$SOURCE_DIR"/*; do
    # Extraer el nombre base del item (archivo o carpeta)
    BASENAME=$(basename "$item")

    # IGNORAR la propia carpeta 'Organized' para no moverse a sí misma
    if [ "$BASENAME" == "Organized" ]; then
        continue
    fi

    # 1. Si es un ARCHIVO, clasificarlo por extensión
    if [[ -f "$item" ]]; then
        shopt -s nocasematch # Ignorar mayúsculas/minúsculas en las extensiones
        case "$item" in
            *.pdf|*.docx|*.doc|*.xlsx|*.xls|*.txt|*.md|*.epub|*.tex) mv "$item" "$DOCUMENTS_DIR" ;;
            *.py|*.js|*.jsx|*.ts|*.java|*.c|*.cpp|*.h|*.cs|*.html|*.css|*.scss|*.sh|*.ipynb|*.sql|*.json|*.xml|*.yml|*.yaml) mv "$item" "$CODE_DIR" ;;
            *.csv|*.tsv|*.data|*.db|*.sqlite|*.parquet) mv "$item" "$DATASETS_DIR" ;;
            *.jpg|*.jpeg|*.png|*.gif|*.bmp|*.svg|*.webp|*.tiff|*.psd|*.ai) mv "$item" "$IMAGES_DIR" ;;
            *.mp3|*.wav|*.aac|*.flac|*.m4a|*.ogg) mv "$item" "$AUDIO_DIR" ;;
            *.mp4|*.mov|*.avi|*.mkv|*.wmv|*.flv) mv "$item" "$VIDEO_DIR" ;;
            *.pptx|*.ppt|*.key|*.odp) mv "$item" "$PRESENTATIONS_DIR" ;;
            *.zip|*.rar|*.7z|*.tar|*.gz|*.bz2|*.xz) mv "$item" "$COMPRESSED_DIR" ;;
            *.dmg|*.pkg|*.exe|*.msi|*.deb|*.rpm|*.appimage|*.bin) mv "$item" "$INSTALLERS_DIR" ;;
            *)
                if [[ "$BASENAME" != "organizador.sh" ]]; then
                    mv "$item" "$OTHER_DIR"
                fi
                ;;
        esac
        shopt -u nocasematch # Reactivar la distinción de mayúsculas/minúsculas
    
    # 2. Si es una CARPETA, moverla al directorio de carpetas
    elif [[ -d "$item" ]]; then
        mv "$item" "$OTHER_FOLDERS_DIR"
    fi
done

echo "✅ ¡Organización completada! Archivos y carpetas han sido clasificados en '$DEST_BASE_DIR'."
