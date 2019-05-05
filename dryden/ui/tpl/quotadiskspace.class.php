<?php

/**
 * @copyright 2014-2015 Sentora Project (http://www.sentora.org/) 
 * Sentora is a GPL fork of the ZPanel Project whose original header follows:
 *
 * Generic template place holder class.
 * @package zpanelx
 * @subpackage dryden -> ui -> tpl
 * @version 1.0.0
 * @author Bobby Allen (ballen@bobbyallen.me)
 * @copyright ZPanel Project (http://www.zpanelcp.com/)
 * @link http://www.zpanelcp.com/
 * @license GPL (http://www.gnu.org/licenses/gpl.html)
 */
class ui_tpl_quotadiskspace {

    public static function Template() {
        $currentuser = ctrl_users::GetUserDetail();
        if ($currentuser['diskquota'] == 0)
            $diskspacequota = '<: Unlimited :>';
        else
            $diskspacequota = fs_director::ShowHumanFileSize($currentuser['diskquota']);
        return $diskspacequota;
    }

}

?>