//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <gtk_theme_fl/gtk_theme_fl_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) gtk_theme_fl_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "GtkThemeFlPlugin");
  gtk_theme_fl_plugin_register_with_registrar(gtk_theme_fl_registrar);
}
