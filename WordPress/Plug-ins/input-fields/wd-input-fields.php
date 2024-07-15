<?php
/**
 * Plugin Name: Test input fields
 * Plugin URI: https://wilbrink.design/wp-plugins/wd-test-input-fields
 * Description: Test input fields.
 * Version: 1.1
 * Author: Wilbrink Design
 * Author URI: https://wilbrink.design
 */

// Get users choices
$opties = get_option('wd_auto_update_wp_inputfields');

// WordPress updates
if ($opties['field1'] == 1) 
{
    add_filter('automatic_updater_disabled', '__return_false'); // Enable auto update for WordPress
    add_filter('auto_update_core', '__return_true');  // Enable auto update for WordPress Core
    add_filter('allow_dev_auto_core_updates', '__return_true');  // Enable auto update for WordPress Core development
    add_filter('allow_minor_auto_core_updates', '__return_true');  // Enable auto update for WordPress Core minor updates
    add_filter('allow_major_auto_core_updates', '__return_true');  // Enable auto update for WordPress Core major updates
    add_filter('auto_update_plugin', '__return_true'); // Enable auto update for WordPress Plug-ins
    add_filter('auto_update_theme', '__return_true'); // Enable auto update for WordPress Themes
    add_filter('auto_update_translation', '__return_true'); // Enable auto update for WordPress Translations
}

// WordPress e-mail notifications
if ($opties['field1'] == 1) 
{
    add_filter('auto_core_update_send_email', '__return_false'); // Disable e-mail notification WordPress Core
    add_filter('auto_plugin_update_send_email', '__return_false'); // Disable e-mail notification WordPress Plug-ins
    add_filter('auto_theme_update_send_email', '__return_false'); // Disable e-mail notification WordPress Themes
}

// Plug-in menu
function wd_auto_update_wp_menu()
{
    add_options_page('Auto update', 'Auto update', 'manage_options', 'wd-auto-update-wp', 'wd_auto_update_wp_page'); // Create menu option in Settings
    add_action('admin_init', 'wd_auto_update_wp_inputfields_db'); // Register input fields voor database
}

add_action('admin_menu', 'wd_auto_update_wp_menu'); // Add to the menu

// Plug-in settings for database
function wd_auto_update_wp_inputfields_db()
{
    register_setting( 'pluginPage', 'wd_auto_update_wp_inputfields' ); // Register input fields, only these fields you can use
}

// Form
function wd_auto_update_wp_page()
{ 
    $options = get_option('wd_auto_update_wp_inputfields');    
    ?>

    <div class='wrap'>
        <h1>Auto update WordPress and disable e-mail notifications</h1>
        <form method="post" action="options.php">
            <?php settings_fields( 'pluginPage' ); ?>
            <?php do_settings_sections( 'pluginPage' ); ?>

            <table class="form-table">
                <tr valign="top">
                <th scope="row">Auto update WordPress Core, Themes, Plug-ins and Translations?</th>
                <td><select name="wd_auto_update_wp_inputfields[field1]"><option value="1" <?php selected($options['field1'], 1); ?>>Yes</option><option value="0" <?php selected($options['field1'], 0); ?>>No</option></select></td>
                </tr>
            </table>

            <?php submit_button(); ?>
        </form>
    </div>
    <?php
}

function wd_auto_update_wp_settings_link($links) 
{
    $links[] = '<a href="'.admin_url( 'options-general.php?page=wd-auto-update-wp' ).'">'.__('Settings').'</a>';
    
    return $links;
}

add_filter('plugin_action_links_'.plugin_basename(__FILE__), 'wd_auto_update_wp_settings_link');