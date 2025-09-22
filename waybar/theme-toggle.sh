
set -euo pipefail

WAYBAR_STYLE_CSS="$HOME/.config/waybar/style.css"

waybar_change_color() {
  local color_key="$1"
  local color_val="$2"
  sed -i "s/^@define-color\s*${color_key}\s.*/@define-color ${color_key} ${color_val};/g" \
    "${WAYBAR_STYLE_CSS}"
}

waybar_reload() {
  killall -SIGUSR2 waybar
}

waybar_darken() {
  echo "-- waybar: let there be darkness"
  waybar_change_color main_bg '#292b2e'
  waybar_change_color text_fg '#fafafb'
  waybar_change_color arrow '#1a1a1a'
  waybar_reload
}

waybar_lighten() {
  echo "-- waybar: let there be light"
  waybar_change_color main_bg '#fafafb'
  waybar_change_color text_fg '#292b2e'
  waybar_change_color arrow 'rgba(0, 0, 0, 0.12)'
  waybar_reload
}

waybar_toggle() {
  # Check if the main foreground color is white, if yes, it's dark.
  if grep -q '@define-color\smain_bg\s#292b2e' "${WAYBAR_STYLE_CSS}"; then
    echo "-- waybar: is currently dark"
    waybar_lighten
  else
    echo "-- waybar: is currently light"
    
    waybar_darken
  fi
}

###########

GTK_THEME_DARK="Adwaita-dark"
GTK_THEME_LIGHT="Adwaita"

gtk_toggle() {
  local current_theme
  current_theme="$(gsettings get org.gnome.desktop.interface gtk-theme | tr -d "'")"

  echo "-- gtk: current theme is ${current_theme}"
  if [ "${current_theme}" = "${GTK_THEME_DARK}" ]; then
    echo "-- gtk: switching to ${GTK_THEME_LIGHT}"
    gsettings set org.gnome.desktop.interface gtk-theme "${GTK_THEME_LIGHT}"
    gsettings set org.gnome.desktop.interface color-scheme prefer-dark
  else
    echo "-- gtk: switching to ${GTK_THEME_DARK}"
    gsettings set org.gnome.desktop.interface gtk-theme "${GTK_THEME_DARK}"
    gsettings set org.gnome.desktop.interface color-scheme prefer-light
  fi
}

waybar_toggle && gtk_toggle