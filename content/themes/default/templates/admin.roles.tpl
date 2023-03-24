<div class="card">
  <div class="card-header with-icon">
    {if $sub_view == ""}
      <div class="float-right">
        <a href="{$system['system_url']}/{$control_panel['url']}/roles/add" class="btn btn-sm btn-primary">
          <i class="fa fa-plus mr5"></i>{__("Add New Group")}
        </a>
      </div>
    {elseif $sub_view == "add" || $sub_view == "edit"}
      <div class="float-right">
        <a href="{$system['system_url']}/{$control_panel['url']}/roles" class="btn btn-sm btn-light">
          <i class="fa fa-arrow-circle-left mr5"></i>{__("Go Back")}
        </a>
      </div>
    {/if}
    <i class="fa fa-gamepad mr10"></i>{__("User Groups")}
    {if $sub_view == "edit"} &rsaquo; {$data['title']}{/if}
    {if $sub_view == "add"} &rsaquo; {__("Add New Group")}{/if}
  </div>

  {if $sub_view == ""}

    <div class="card-body">
      <div class="table-responsive">
        <table class="table table-striped table-bordered table-hover js_dataTable">
          <thead>
            <tr>
              <th>{__("ID")}</th>
              <th>{__("User Group")}</th>
              <th>{__("Actions")}</th>
            </tr>
          </thead>
          <tbody>
            {foreach $rows as $row}
              <tr>
                <td>{$row['order_field']}</td>
                <td>
                  <a href="{$system['system_url']}/{$control_panel['url']}/roles/edit/{$row['group_id']}/{$row['title_url']}">
                    {$row['group_name']}
                  </a>
                </td>
                <td>
                  <a data-toggle="tooltip" data-placement="top" title='{__("Edit")}' href="{$system['system_url']}/{$control_panel['url']}/roles/edit/{$row['group_id']}" class="btn btn-sm btn-icon btn-rounded btn-primary">
                    <i class="fa fa-pencil-alt"></i>
                  </a>
                  <button data-toggle="tooltip" data-placement="top" title='{__("Delete")}' class="btn btn-sm btn-icon btn-rounded btn-danger js_admin-deleter" data-handle="roles" data-id="{$row['group_id']}">
                    <i class="fa fa-trash-alt"></i>
                  </button>
                </td>
              </tr>
            {/foreach}
          </tbody>
        </table>
      </div>
    </div>

  {elseif $sub_view == "edit"}

    <form class="js_ajax-forms" data-url="admin/roles.php?do=edit&id={$data['group_id']}">
      <div class="card-body">
        <div class="form-group form-row">
          <label class="col-md-3 form-control-label">
            {__("Name")}
          </label>
          <div class="col-md-9">
            <input class="form-control" name="group_name" value="{$data['group_name']}">
          </div>
        </div>

        <div class="form-group form-row">
          <label class="col-md-3 form-control-label">
            {__("Order Field")}
          </label>
          <div class="col-md-9">
            <input class="form-control" name="order_field" value="{$data['order_field']}">
          </div>
        </div>

        <div class="form-group form-row">
          <label class="col-md-3 form-control-label">
            {__("Description")}
          </label>
          <div class="col-md-9">
            <textarea rows="5" class="form-control" name="description">{$data['description']}</textarea>
          </div>
        </div>

        <div class="container">
          <div class="row">
            <div class="col col-lg-6">
              <div class="row">
                <div class="col col-lg-3">
                  <label class="switch" for="create_post">
                    <input type="checkbox" name="create_post" id="create_post" {if $data['create_post']==1}checked{/if}>
                    <span class="slider round"></span>
                  </label>
                </div>
                <div class="col col-lg-9">
                  <div class="form-control-label h6">{__("Create Post")}</div>
                </div>
              </div>
              <div class="row">
                <div class="col col-lg-3">
                  <label class="switch" for="create_articles">
                    <input type="checkbox" name="create_articles" value="0" id="create_articles" {if $data['create_articles']==1}checked{/if}>
                    <span class="slider round"></span>
                  </label>
                </div>
                <div class="col col-lg-9">
                  <div class="form-control-label h6">{__("Create articles")}</div>
                </div>
              </div>
              <div class="row">
                <div class="col col-lg-3">
                  <label class="switch" for="share">
                    <input type="checkbox" name="share" id="share" {if $data['share']==1}checked{/if}>
                    <span class="slider round"></span>
                  </label>
                </div>
                <div class="col col-lg-9">
                  <div class="form-control-label h6">{__("share")}</div>
                </div>
              </div>
              <div class="row">
                <div class="col col-lg-3">
                  <label class="switch" for="comments">
                    <input type="checkbox" name="comments" id="comments" {if $data['comments']==1}checked{/if}>
                    <span class="slider round"></span>
                  </label>
                </div>
                <div class="col col-lg-9">
                  <div class="form-control-label h6">{__("Comments")}</div>
                </div>
              </div>
              <div class="row">
                <div class="col col-lg-3">
                  <label class="switch" for="likes">
                    <input type="checkbox" name="likes" id="likes" {if $data['likes']==1}checked{/if}>
                    <span class="slider round"></span>
                  </label>
                </div>
                <div class="col col-lg-9">
                  <div class="form-control-label h6">{__("Likes")}</div>
                </div>
              </div>
              <div class="row">
                <div class="col col-lg-3">
                  <label class="switch" for="star_rate">
                    <input type="checkbox" name="star_rate" id="star_rate" {if $data['star_rate']==1}checked{/if}>
                    <span class="slider round"></span>
                  </label>
                </div>
                <div class="col col-lg-9">
                  <div class="form-control-label h6">{__("Star Rate")}</div>
                </div>
              </div>
              <div class="row">
                <div class="col col-lg-3">
                  <label class="switch" for="create_page">
                    <input type="checkbox" name="create_page" id="create_page" {if $data['create_page']==1}checked{/if}>
                    <span class="slider round"></span>
                  </label>
                </div>
                <div class="col col-lg-9">
                  <div class="form-control-label h6">{__("Create Page")}</div>
                </div>
              </div>
              <div class="row">
                <div class="col col-lg-3">
                  <label class="switch" for="manager_page">
                    <input type="checkbox" name="manager_page" id="manager_page"  {if $data['manager_page']==1}checked{/if}>
                    <span class="slider round"></span>
                  </label>
                </div>
                <div class="col col-lg-9">
                  <div class="form-control-label h6">{__("Manager Page")}</div>
                </div>
              </div>
              <div class="row">
                <div class="col col-lg-3">
                  <label class="switch" for="add_friend">
                    <input type="checkbox" name="add_friend" id="add_friend"  {if $data['add_friend']==1}checked{/if}>
                    <span class="slider round"></span>
                  </label>
                </div>
                <div class="col col-lg-9">
                  <div class="form-control-label h6">{__("add friends")}</div>
                </div>
              </div>
              <div class="row">
                <div class="col col-lg-3">
                  <label class="switch" for="follow_page" style="height:30px">
                    <input type="checkbox" name="follow_page" id="follow_page"  {if $data['follow_page']==1}checked{/if}>
                    <span class="slider round"></span>
                  </label>
                </div>
                <div class="col col-lg-9">
                  <div class="form-control-label h6">{__("Follow Pages")}</div>
                </div>
              </div>
            </div>
            <div class="col col-lg-6">
              <div class="row">
                <div class="col col-lg-3">
                  <label class="switch" for="follow_writer">
                    <input type="checkbox" name="follow_writer" id="follow_writer"  {if $data['follow_writer']==1}checked{/if}>
                    <span class="slider round"></span>
                  </label>
                </div>
                <div class="col col-lg-9">
                  <div class="form-control-label h6">{__("Follow Writers")}</div>
                </div>
              </div>
              <div class="row">
                <div class="col col-lg-3">
                  <label class="switch" for="manager_user">
                    <input type="checkbox" name="manager_user" id="manager_user"  {if $data['manager_user']==1}checked{/if}>
                    <span class="slider round"></span>
                  </label>
                </div>
                <div class="col col-lg-9">
                  <div class="form-control-label h6">{__("Manager Users")}</div>
                </div>
              </div>
              <div class="row">
                <div class="col col-lg-3">
                  <label class="switch" for="created_user_grp">
                    <input type="checkbox" name="created_user_grp" id="created_user_grp"  {if $data['created_user_grp']==1}checked{/if}>
                    <span class="slider round"></span>
                  </label>
                </div>
                <div class="col col-lg-9">
                  <div class="form-control-label h6">{__("Cretea User Group")}</div>
                </div>
              </div>
              <div class="row">
                <div class="col col-lg-3">
                  <label class="switch" for="change_logo">
                    <input type="checkbox" name="change_logo" id="change_logo"  {if $data['change_logo']==1}checked{/if}>
                    <span class="slider round"></span>
                  </label>
                </div>
                <div class="col col-lg-9">
                  <div class="form-control-label h6">{__("Change Logo")}</div>
                </div>
              </div>
              <div class="row">
                <div class="col col-lg-3">
                  <label class="switch" for="approves_category">
                    <input type="checkbox" name="approves_category" id="approves_category"  {if $data['approves_category']==1}checked{/if}>
                    <span class="slider round"></span>
                  </label>
                </div>
                <div class="col col-lg-9">
                  <div class="form-control-label h6">{__("Approves Categories")}</div>
                </div>
              </div>
              <div class="row">
                <div class="col col-lg-3">
                  <label class="switch" for="approves_type">
                    <input type="checkbox" name="approves_type" id="approves_type" {if $data['approves_type']==1}checked{/if}>
                    <span class="slider round"></span>
                  </label>
                </div>
                <div class="col col-lg-9">
                  <div class="form-control-label h6">{__("Approves Types")}</div>
                </div>
              </div>
              <div class="row">
                <div class="col col-lg-3">
                  <label class="switch" for="approves_ads">
                    <input type="checkbox" name="approves_ads" id="approves_ads"  {if $data['approves_ads']==1}checked{/if}>
                    <span class="slider round"></span>
                  </label>
                </div>
                <div class="col col-lg-9">
                  <div class="form-control-label h6">{__("Approves Ads")}</div>
                </div>
              </div>
              <div class="row">
                <div class="col col-lg-3">
                  <label class="switch" for="control_panel_setting">
                    <input type="checkbox" name="control_panel_setting" id="control_panel_setting" {if $data['control_panel_setting']==1}checked{/if}>
                    <span class="slider round"></span>
                  </label>
                </div>
                <div class="col col-lg-9">
                  <div class="form-control-label h6">{__("Control Panel Setting")}</div>
                </div>
              </div>
              <div class="row">
                <div class="col col-lg-3">
                  <label class="switch" for="manage_support">
                    <input type="checkbox" name="manage_support" id="manage_support" {if $data['manage_support']==1}checked{/if}>
                    <span class="slider round"></span>
                  </label>
                </div>
                <div class="col col-lg-9">
                  <div class="form-control-label h6">{__("Manage Support")}</div>
                </div>
              </div>
              
            </div>
          </div>
        </div>


        <!-- success -->
        <div class="alert alert-success mb0 x-hidden"></div>
        <!-- success -->

        <!-- error -->
        <div class="alert alert-danger mb0 x-hidden"></div>
        <!-- error -->
      </div>
      <div class="card-footer text-right">
        <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
      </div>
    </form>

  {elseif $sub_view == "add"}

    <form class="js_ajax-forms" data-url="admin/roles.php?do=add">
      <div class="card-body">
        <div class="form-group form-row">
          <label class="col-md-3 form-control-label">
            {__("Name")}
          </label>
          <div class="col-md-9">
            <input class="form-control" name="group_name">
          </div>
        </div>

        <div class="form-group form-row">
          <label class="col-md-3 form-control-label">
            {__("Description")}
          </label>
          <div class="col-md-9">
            <textarea class="form-control" name="description"></textarea>
          </div>
        </div>

        <div class="container">
          <div class="row">
            <div class="col col-lg-6">
              <div class="row">
                <div class="col col-lg-3">
                  <label class="switch" for="create_post">
                    <input type="checkbox" name="create_post" id="create_post" checked>
                    <span class="slider round"></span>
                  </label>
                </div>
                <div class="col col-lg-9">
                  <div class="form-control-label h6">{__("Create Post")}</div>
                </div>
              </div>
              <div class="row">
                <div class="col col-lg-3">
                  <label class="switch" for="create_articles">
                    <input type="checkbox" name="create_articles" value="0" id="create_articles" checked>
                    <span class="slider round"></span>
                  </label>
                </div>
                <div class="col col-lg-9">
                  <div class="form-control-label h6">{__("Create articles")}</div>
                </div>
              </div>
              <div class="row">
                <div class="col col-lg-3">
                  <label class="switch" for="share">
                    <input type="checkbox" name="share" id="share" checked>
                    <span class="slider round"></span>
                  </label>
                </div>
                <div class="col col-lg-9">
                  <div class="form-control-label h6">{__("share")}</div>
                </div>
              </div>
              <div class="row">
                <div class="col col-lg-3">
                  <label class="switch" for="comments">
                    <input type="checkbox" name="comments" id="comments" checked>
                    <span class="slider round"></span>
                  </label>
                </div>
                <div class="col col-lg-9">
                  <div class="form-control-label h6">{__("Comments")}</div>
                </div>
              </div>
              <div class="row">
                <div class="col col-lg-3">
                  <label class="switch" for="likes">
                    <input type="checkbox" name="likes" id="likes" checked>
                    <span class="slider round"></span>
                  </label>
                </div>
                <div class="col col-lg-9">
                  <div class="form-control-label h6">{__("Likes")}</div>
                </div>
              </div>
              <div class="row">
                <div class="col col-lg-3">
                  <label class="switch" for="star_rate">
                    <input type="checkbox" name="star_rate" id="star_rate" checked>
                    <span class="slider round"></span>
                  </label>
                </div>
                <div class="col col-lg-9">
                  <div class="form-control-label h6">{__("Star Rate")}</div>
                </div>
              </div>
              <div class="row">
                <div class="col col-lg-3">
                  <label class="switch" for="create_page">
                    <input type="checkbox" name="create_page" id="create_page" checked>
                    <span class="slider round"></span>
                  </label>
                </div>
                <div class="col col-lg-9">
                  <div class="form-control-label h6">{__("Create Page")}</div>
                </div>
              </div>
              <div class="row">
                <div class="col col-lg-3">
                  <label class="switch" for="manager_page">
                    <input type="checkbox" name="manager_page" id="manager_page" checked>
                    <span class="slider round"></span>
                  </label>
                </div>
                <div class="col col-lg-9">
                  <div class="form-control-label h6">{__("Manager Page")}</div>
                </div>
              </div>
              <div class="row">
                <div class="col col-lg-3">
                  <label class="switch" for="add_friend">
                    <input type="checkbox" name="add_friend" id="add_friend" checked>
                    <span class="slider round"></span>
                  </label>
                </div>
                <div class="col col-lg-9">
                  <div class="form-control-label h6">{__("add friends")}</div>
                </div>
              </div>
              <div class="row">
                <div class="col col-lg-3">
                  <label class="switch" for="follow_page" style="height:30px">
                    <input type="checkbox" name="follow_page" id="follow_page" checked>
                    <span class="slider round"></span>
                  </label>
                </div>
                <div class="col col-lg-9">
                  <div class="form-control-label h6">{__("Follow Pages")}</div>
                </div>
              </div>
            </div>
            <div class="col col-lg-6">
              <div class="row">
                <div class="col col-lg-3">
                  <label class="switch" for="follow_writer">
                    <input type="checkbox" name="follow_writer" id="follow_writer" checked>
                    <span class="slider round"></span>
                  </label>
                </div>
                <div class="col col-lg-9">
                  <div class="form-control-label h6">{__("Follow Writers")}</div>
                </div>
              </div>
              <div class="row">
                <div class="col col-lg-3">
                  <label class="switch" for="manager_user">
                    <input type="checkbox" name="manager_user" id="manager_user" checked>
                    <span class="slider round"></span>
                  </label>
                </div>
                <div class="col col-lg-9">
                  <div class="form-control-label h6">{__("Manager Users")}</div>
                </div>
              </div>
              <div class="row">
                <div class="col col-lg-3">
                  <label class="switch" for="created_user_grp">
                    <input type="checkbox" name="created_user_grp" id="created_user_grp" checked>
                    <span class="slider round"></span>
                  </label>
                </div>
                <div class="col col-lg-9">
                  <div class="form-control-label h6">{__("Cretea User Group")}</div>
                </div>
              </div>
              <div class="row">
                <div class="col col-lg-3">
                  <label class="switch" for="change_logo">
                    <input type="checkbox" name="change_logo" id="change_logo" checked>
                    <span class="slider round"></span>
                  </label>
                </div>
                <div class="col col-lg-9">
                  <div class="form-control-label h6">{__("Change Logo")}</div>
                </div>
              </div>
              <div class="row">
                <div class="col col-lg-3">
                  <label class="switch" for="approves_category">
                    <input type="checkbox" name="approves_category" id="approves_category" checked>
                    <span class="slider round"></span>
                  </label>
                </div>
                <div class="col col-lg-9">
                  <div class="form-control-label h6">{__("Approves Categories")}</div>
                </div>
              </div>
              <div class="row">
                <div class="col col-lg-3">
                  <label class="switch" for="approves_type">
                    <input type="checkbox" name="approves_type" id="approves_type" checked>
                    <span class="slider round"></span>
                  </label>
                </div>
                <div class="col col-lg-9">
                  <div class="form-control-label h6">{__("Approves Types")}</div>
                </div>
              </div>
              <div class="row">
                <div class="col col-lg-3">
                  <label class="switch" for="approves_ads">
                    <input type="checkbox" name="approves_ads" id="approves_ads" checked>
                    <span class="slider round"></span>
                  </label>
                </div>
                <div class="col col-lg-9">
                  <div class="form-control-label h6">{__("Approves Ads")}</div>
                </div>
              </div>
              <div class="row">
                <div class="col col-lg-3">
                  <label class="switch" for="manage_support">
                    <input type="checkbox" name="manage_support" id="manage_support" checked>
                    <span class="slider round"></span>
                  </label>
                </div>
                <div class="col col-lg-9">
                  <div class="form-control-label h6">{__("Manage Supprt")}</div>
                </div>
              </div>              
              <div class="row">
                <div class="col col-lg-3">
                  <label class="switch" for="control_panel_Setting">
                    <input type="checkbox" name="control_panel_Setting" id="control_panel_Setting" checked>
                    <span class="slider round"></span>
                  </label>
                </div>
                <div class="col col-lg-9">
                  <div class="form-control-label h6">{__("Control Panel Setting")}</div>
                </div>
              </div>
            </div>
          </div>
        </div>




        <!-- success -->
        <div class="alert alert-success mb0 x-hidden"></div>
        <!-- success -->

        <!-- error -->
        <div class="alert alert-danger mb0 x-hidden"></div>
        <!-- error -->
      </div>
      <div class="card-footer text-right">
        <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
      </div>
    </form>

  {/if}
</div>