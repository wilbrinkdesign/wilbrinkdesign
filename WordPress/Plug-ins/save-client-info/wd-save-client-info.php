<?php
/**
 * Plugin Name: Save client info
 * Plugin URI: https://wilbrink.design
 * Description: Save client info to the Wordpress database.
 * Version: 1.1
 * Author: Wilbrink Design
 * Author URI: https://wilbrink.design
 */

// Create sql table
function wd_analytics_install() 
{
    global $wpdb;

    $table_name = $wpdb->prefix . 'clients_analytics';
    
    $charset_collate = $wpdb->get_charset_collate();

    $sql = "CREATE TABLE $table_name (
        id mediumint(9) NOT NULL AUTO_INCREMENT,
        datum datetime DEFAULT '0000-00-00 00:00:00' NOT NULL,
        ip tinytext NOT NULL,
        url tinytext NOT NULL,
        PRIMARY KEY  (id)
    ) $charset_collate;";

    require_once(ABSPATH . 'wp-admin/includes/upgrade.php');
    dbDelta($sql);
}

// Add data to the sql table
function wd_analytics_data() 
{
    global $wpdb;
    
    $ip = $_SERVER['REMOTE_ADDR'];
    $url = $_SERVER['REQUEST_URI'];
    
    $table_name = $wpdb->prefix . 'clients_analytics';
    
    $wpdb->insert( 
        $table_name, 
        array( 
            'datum' => current_time('mysql'), 
            'ip' => $ip, 
            'url' => $url, 
        ) 
    );
}

// Call functions
wd_analytics_install();
wd_analytics_data();

// Plugin menu
function wd_clients_analytics_menu()
{
    add_options_page('Clients analytics', 'Clients analytics', 'manage_options', 'wd-clients-analytics', 'wd_clients_analytics_page'); // Create menu option in Settings
}

add_action('admin_menu', 'wd_clients_analytics_menu'); // Add to the menu

// Settings page
function wd_clients_analytics_page()
{
    global $wpdb;
    
    $table_name = $wpdb->prefix . 'clients_analytics';
    
    $result = $wpdb->get_results("SELECT * FROM $table_name ORDER BY id DESC");
    ?>

    <div class='wrap'>
        <table>
            <h1>Analytics</h1>
            <?php
            foreach ($result as $row)
            {
                echo "<tr>";
                echo "<td>".$row->datum."</td>";
                echo "<td>".$row->ip."</td>";
                echo "<td>".$row->url."</td>";
                echo "</tr>";
            }
            ?>
        </table>
        </h1>
    </div>
    <?php
}

// Settings link
function wd_clients_analytics_link($links) 
{
    $links[] = '<a href="'.admin_url( 'options-general.php?page=wd-clients-analytics' ).'">'.__('Settings').'</a>';
    
    return $links;
}

add_filter('plugin_action_links_'.plugin_basename(__FILE__), 'wd_clients_analytics_link');