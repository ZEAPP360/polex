<?php

/**
 * ajax -> admin -> roles
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootstrap
require('../../../bootstrap.php');

// check AJAX Request
is_ajax();

// check admin|moderator permission
if(!$user->check_capability($user->_data['user_group'], 'created_user_grp')){
  modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
}

// check demo account
if ($user->_data['user_demo']) {
  modal("ERROR", __("Demo Restriction"), __("You can't do this with demo account"));
}

// handle games
try {
  $_POST["group_name"] = (isset($_POST['group_name'])) ? $_POST['group_name'] : 'Unnamed Role';
  $_POST['create_post'] = (isset($_POST['create_post'])) ? '1' : '0';
  $_POST['create_articles'] = (isset($_POST['create_articles'])) ? '1' : '0';
  $_POST['share'] = (isset($_POST['share'])) ? '1' : '0';
  $_POST['comments'] = (isset($_POST['comments'])) ? '1' : '0';
  $_POST['likes'] = (isset($_POST['likes'])) ? '1' : '0';
  $_POST['star_rate'] = (isset($_POST['star_rate'])) ? '1' : '0';
  $_POST['create_page'] = (isset($_POST['create_page'])) ? '1' : '0';
  $_POST['manager_page'] = (isset($_POST['manager_page'])) ? '1' : '0';
  $_POST['add_friend'] = (isset($_POST['add_friend'])) ? '1' : '0';
  $_POST['follow_page'] = (isset($_POST['follow_page'])) ? '1' : '0';
  $_POST['follow_writer'] = (isset($_POST['follow_writer'])) ? '1' : '0';
  $_POST['manager_user'] = (isset($_POST['manager_user'])) ? '1' : '0';
  $_POST['created_user_grp'] = (isset($_POST['created_user_grp'])) ? '1' : '0';
  $_POST['created_logo'] = (isset($_POST['created_logo'])) ? '1' : '0';
  $_POST['approves_category'] = (isset($_POST['approves_category'])) ? '1' : '0';
  $_POST['approves_type'] = (isset($_POST['approves_type'])) ? '1' : '0';
  $_POST['approves_ads'] = (isset($_POST['approves_ads'])) ? '1' : '0';
  $_POST['control_panel_setting'] = (isset($_POST['control_panel_setting'])) ? '1' : '0';
  $_POST['manage_canters'] = (isset($_POST['manage_canters'])) ? '1' : '0';
  $_POST['order_field'] = (isset($_POST['order_field'])) ? '1' : '0';

  switch ($_GET['do']) {
    case 'edit':
      /* valid inputs */
      if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
        _error(400);
      }
      /* update */
      $sql = sprintf("UPDATE user_group SET group_name = %s, create_post = %s, create_article = %s, share_post = %s,comments = %s, likes = %s, star_rate = %s, create_pages = %s, manager_page = %s, add_friends = %s, follow_pages = %s, follow_writers = %s, manager_users = %s, create_user_group = %s, change_logo = %s ,control_panel_setting=  %s, manage_support =  %s , add_jobs =  %s, manage_support =  %s, description =  %s, order_field =  %s WHERE group_id = %s", secure($_POST['group_name']), secure($_POST['create_post'],'int'), secure($_POST['create_articles'],'int'), secure($_POST['share'],'int'), secure($_POST['comments'],'int'), secure($_POST['likes'],'int'), secure($_POST['star_rate'],'int'), secure($_POST['create_page'],'int'), secure($_POST['manager_page'],'int'), secure($_POST['add_friend'],'int'), secure($_POST['follow_page'],'int'), secure($_POST['follow_writer'],'int'), secure($_POST['manager_user'],'int'), secure($_POST['created_user_grp'],'int'), secure($_POST['created_logo'],'int'), secure($_POST['approves_category'],'int'), secure($_POST['approves_type'],'int'), secure($_POST['approves_ads'],'int'), secure($_POST['control_panel_setting'],'int'),secure($_POST['description']),secure($_POST['order_field'],'int'),secure($_GET['id'],'int'));

      // 
      $db->query($sql) or _error("SQL_ERROR_THROWEN");
      /* return */
      return_json(array('success' => true, 'message' => __("User role has been updated")));
      break;

    case 'add':
      /* insert */
      $sql = sprintf("INSERT INTO user_group (`group_name`, `create_post`, `create_article`, `share_post`, `comments`, `likes`, `star_rate`, `create_pages`, `manager_page`, `add_friends`, `follow_pages`, `follow_writers`, `manager_users`, `create_user_group`, `change_logo`, `control_panel_setting`, `approves_type`, `add_jobs`, `manage_support`, `description`, `order_field`) VALUES (%s, %s, %s, %s, %s, %s, %s,%s, %s, %s, %s, %s, %s, %s,%s, %s, %s, %s, %s, %s, 5)",
                                    secure($_POST['group_name']), secure($_POST['create_post'],'int'), secure($_POST['create_article'],'int'), secure($_POST['share_post'],'int'), secure($_POST['comments'],'int'), secure($_POST['likes'],'int'), secure($_POST['star_rate'],'int'), secure($_POST['create_pages'],'int'), secure($_POST['manager_page'],'int'), secure($_POST['add_friends'],'int'), secure($_POST['follow_pages'],'int'), secure($_POST['follow_writers'],'int'), secure($_POST['manager_users'],'int'), secure($_POST['create_user_group'],'int'), secure($_POST['change_logo'],'int'), secure($_POST['control_panel_setting'],'int') , secure($_POST['control_panel_setting'],'int') , secure($_POST['manage_canters'],'int') , secure($_POST['add_jobs'],'int') , secure($_POST['manage_support'],'int') , secure($_POST['description'])    ); 
      $db->query($sql) or _error("SQL_ERROR_THROWEN");
      /* return */
      return_json(array('callback' => 'window.location = "' . $system['system_url'] . '/' . $control_panel['url'] . '/roles";'));
      break;

    default:
      _error(400);
      break;
  }
} catch (Exception $e) {
  return_json(array('error' => true, 'message' => $e->getMessage()));
}
