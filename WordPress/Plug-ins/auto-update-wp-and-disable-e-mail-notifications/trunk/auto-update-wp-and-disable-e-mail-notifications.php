<?php
/**
 * Plugin Name: Automatic updates for WordPress
 * Plugin URI: https://wilbrink.design/wp-plugins/auto-update-wp-and-disable-e-mail-notifications
 * Description: Keep your WordPress site up-to-date and disable email notifications about WordPress updates.
 * Version: 1.1
 * Author: Wilbrink Design
 * Author URI: https://wilbrink.design
 */

// Enable auto update for WordPress
add_filter('automatic_updater_disabled', '__return_false');

// Auto update WordPress Core and disable email notifications
add_filter('auto_update_core', '__return_true');
add_filter('allow_dev_auto_core_updates', '__return_true');
add_filter('allow_minor_auto_core_updates', '__return_true');
add_filter('allow_major_auto_core_updates', '__return_true');
add_filter('auto_core_update_send_email', '__return_false');

// Auto update WordPress Plug-ins and disable email notifications
add_filter('auto_update_plugin', '__return_true');
add_filter('auto_plugin_update_send_email', '__return_false');

// Auto update WordPress Themes and disable email notifications
add_filter('auto_update_theme', '__return_true');
add_filter('auto_theme_update_send_email', '__return_false');

// Auto update WordPress Translations
add_filter('auto_update_translation', '__return_true');