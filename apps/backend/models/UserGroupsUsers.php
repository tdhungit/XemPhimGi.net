<?php
/**
 * Created by Jacky.
 * User: Jacky
 * Date: 7/29/2015
 * Time: 11:37 AM
 * Project: carofw
 * File: UserGroupsUsers.php
 */

namespace Modules\Backend\Models;


class UserGroupsUsers extends ModelBase
{
    public $id;
    public $created;
    public $user_created_id;
    public $deleted;
    public $user_id;
    public $group_id;
}