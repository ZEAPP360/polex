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
if(!$user->check_capability($user->_data['user_group'], 'create_user_group')){
  modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
}

// check demo account
if ($user->_data['user_demo']) {
  modal("ERROR", __("Demo Restriction"), __("You can't do this with demo account"));
}

// handle games
try {
  

 $_POST['group_name'] = (isset($_POST['group_name'])) ? $_POST['group_name'] : 'No Name';
 $_POST['create_post'] = (isset($_POST['create_post'])) ? '1' : '0';
 $_POST['create_article'] = (isset($_POST['create_article']))  ? '1' : '0';
 $_POST['edit_article'] = (isset($_POST['edit_article']))  ? '1' : '0';
 $_POST['view_article'] = (isset($_POST['view_article']))  ? '1' : '0';
 $_POST['delete_article'] = (isset($_POST['delete_article']))  ? '1' : '0';
 $_POST['approve_article'] = (isset($_POST['approve_article']))  ? '1' : '0';
 $_POST['share_post'] = (isset($_POST['share_post']))  ? '1' : '0';
 $_POST['add_comment'] = (isset($_POST['add_comment']))  ? '1' : '0';
 $_POST['edit_comment'] = (isset($_POST['edit_comment'])) ? '1' : '0';
 $_POST['likes'] = (isset($_POST['likes'])) ? '1' : '0';
 $_POST['star_rate'] = (isset($_POST['star_rate']))  ? '1' : '0';
 $_POST['create_page'] = (isset($_POST['create_page']))  ? '1' : '0';
 $_POST['manager_page'] = (isset($_POST['manager_page']))  ? '1' : '0';
 $_POST['add_friend'] = (isset($_POST['add_friend']))  ? '1' : '0';
 $_POST['follow_page'] = (isset($_POST['follow_page']))  ? '1' : '0';
 $_POST['follow_writer'] = (isset($_POST['follow_writer'])) ? '1' : '0';
 $_POST['manage_user'] = (isset($_POST['manage_user'])) ? '1' : '0';
 $_POST['create_user_group'] = (isset($_POST['create_user_group']))  ? '1' : '0';
 $_POST['change_logo'] = (isset($_POST['change_logo']))  ? '1' : '0';
 $_POST['control_panel_setting'] = (isset($_POST['control_panel_setting']))  ? '1' : '0';
 $_POST['approves_type'] = (isset($_POST['approves_type'])) ? '1' : '0';
 $_POST['add_jobs'] = (isset($_POST['add_jobs'])) ? '1' : '0';
 $_POST['manage_support'] = (isset($_POST['manage_support'])) ? '1' : '0';
 $_POST['approves_category'] = (isset($_POST['approves_category'])) ? '1' : '0';
 $_POST['disable_social_media'] = (isset($_POST['disable_social_media'])) ? '1' : '0';
 $_POST['manage_reported_content'] = (isset($_POST['manage_reported_content'])) ? '1' : '0';
 $_POST['invite_researchers'] = (isset($_POST['invite_researchers'])) ? '1' : '0';
 $_POST['can_add_tags'] = (isset($_POST['can_add_tags']))  ? '1' : '0';
 $_POST['description'] = (isset($_POST['description'])) ? $_POST['description'] : '-';
 $_POST['order_field'] = (isset($_POST['order_field'])) ? $_POST['order_field'] : '10';

  switch ($_GET['do']) {
    case 'edit':
      /* valid inputs */
      if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
        _error(400);
      }
      /* update */
      $sql = sprintf("UPDATE user_group SET group_name = %s, create_post = %s, create_article = %s, edit_article = %s, view_article = %s, delete_article = %s, approve_article = %s, share_post = %s, add_comment = %s, edit_comment = %s, likes = %s, star_rate = %s, create_page = %s, manager_page = %s, add_friend = %s ,follow_page=  %s, follow_writer =  %s , manage_user =  %s, create_user_group =  %s, change_logo =  %s, control_panel_setting =  %s, approves_type =  %s, add_jobs =  %s, manage_support =  %s, approves_category =  %s, disable_social_media =  %s, manage_reported_content =  %s, invite_researchers =  %s, can_add_tags =  %s, description =  %s, order_field =  %s WHERE group_id = %s", secure($_POST['group_name']), secure($_POST['create_post'],'int'), secure($_POST['create_article'],'int'), secure($_POST['edit_article'],'int'), secure($_POST['view_article'],'int'), secure($_POST['delete_article'],'int'), secure($_POST['approve_article'],'int'), secure($_POST['share_post'],'int'), secure($_POST['add_comment'],'int'), secure($_POST['edit_comment'],'int'), secure($_POST['likes'],'int'), secure($_POST['star_rate'],'int'), secure($_POST['create_page'],'int'), secure($_POST['manager_page'],'int'), secure($_POST['add_friend'],'int'), secure($_POST['follow_page'],'int'), secure($_POST['follow_writer'],'int') , secure($_POST['manage_user'],'int') , secure($_POST['create_user_group'],'int') , secure($_POST['change_logo'],'int') , secure($_POST['control_panel_setting'],'int') , secure($_POST['approves_type'],'int'), secure($_POST['add_jobs'],'int'), secure($_POST['manage_support'],'int'), secure($_POST['approves_category'],'int'), secure($_POST['disable_social_media'],'int'), secure($_POST['manage_reported_content'],'int'), secure($_POST['invite_researchers'],'int'), secure($_POST['can_add_tags'],'int'), secure($_POST['description']), secure($_POST['order_field']), secure($_GET['id'],'int'));

      // 
      $db->query($sql) or _error("SQL_ERROR_THROWEN");
      /* return */
      return_json(array('success' => true, 'message' => __("User role has been updated")));
      break;

    case 'add':
      /* insert */

      $sql = sprintf("INSERT INTO user_group (
        `group_name`, `create_post`, `create_article`, `edit_article`, `view_article`, `delete_article`, `approve_article`, `share_post`, `add_comment`, `edit_comment`, `likes`, `star_rate`, `create_page`, `manager_page`, `add_friend`, `follow_page`, `follow_writer`, `manage_user`, `create_user_group`, `change_logo`, `control_panel_setting`, `approves_type`, `add_jobs`, `manage_support`, `approves_category`, `disable_social_media`, `manage_reported_content`, `invite_researchers`, `can_add_tags`, `description`, `order_field`) VALUES (%s, %s, %s, %s, %s, %s,%s, %s, %s, %s, %s, %s, %s,%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)",
        secure($_POST['group_name']), secure($_POST['create_post'],'int'), secure($_POST['create_article'],'int'), secure($_POST['edit_article'],'int'), secure($_POST['view_article'],'int'), secure($_POST['delete_article'],'int'), secure($_POST['approve_article'],'int'), secure($_POST['share_post'],'int'), secure($_POST['add_comment'],'int'), secure($_POST['edit_comment'],'int'), secure($_POST['likes'],'int'), secure($_POST['star_rate'],'int'), secure($_POST['create_page'],'int'), secure($_POST['manager_page'],'int'), secure($_POST['add_friend'],'int'), secure($_POST['follow_page'],'int'), secure($_POST['follow_writer'],'int') , secure($_POST['manage_user'],'int') , secure($_POST['create_user_group'],'int') , secure($_POST['change_logo'],'int') , secure($_POST['control_panel_setting'],'int') , secure($_POST['approves_type'],'int'), secure($_POST['add_jobs'],'int'), secure($_POST['manage_support'],'int'), secure($_POST['approves_category'],'int'), secure($_POST['disable_social_media'],'int'), secure($_POST['manage_reported_content'],'int'), secure($_POST['invite_researchers'],'int'), secure($_POST['can_add_tags'],'int'), secure($_POST['description']), secure($_POST['order_field'])    ); 
 
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
