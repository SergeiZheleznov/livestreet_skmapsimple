<?php
/*-------------------------------------------------------
*
*   Plugin "Skmapsimple"
*   Author: Zheleznov Sergey (skif)
*   Site: livestreet.ru/profile/skif/
*   Contact e-mail: sksdes@gmail.com
*
---------------------------------------------------------
*/
if (!class_exists('Plugin')) {
    die('Hacking attemp!');
}

class PluginSkmapsimple extends Plugin {

    protected $aInherits=array(
        'action' => array('ActionTopic'),
        'entity'  =>array('ModuleTopic_EntityTopic'),
    );

    public function Activate() {
        return true;
    }

    public function Init() {
    }
}
?>
