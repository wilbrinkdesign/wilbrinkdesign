<?php
/**
 * Plugin Name: Auto update WP and disable e-mail notifications
 * Plugin URI: https://wilbrink.design/wp-plugins/wd-auto-update
 * Description: Due to security requirements it is very important to keep your WordPress site up-to-date. This plug-in will auto update WordPress Core, Themes, Plug-ins and Translations. E-mail notifications about WordPress updates will be disabled.
 * Version: 1.0
 * Author: Wilbrink Design
 * Author URI: https://wilbrink.design
 */

// Enable auto update for WordPress
add_filter( 'automatic_updater_disabled', '__return_false' );

// Auto update WordPress Core and disable e-mail notification
add_filter( 'auto_update_core', '__return_true' );
add_filter( 'auto_core_update_send_email', '__return_false' );

// Auto update WordPress Plug-ins and disable e-mail notification
add_filter( 'auto_update_plugin', '__return_true' );
add_filter( 'auto_plugin_update_send_email', '__return_false' );

// Auto update WordPress Themes and disable e-mail notification
add_filter( 'auto_update_theme', '__return_true' );
add_filter( 'auto_theme_update_send_email', '__return_false' );

// Auto update WordPress Translations
add_filter( 'auto_update_translation', '__return_true' );