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

class PluginSkmapsimple_HookSkmapsimple extends Hook {

    protected $oUserCurrent;
    protected $bShowMap = true;

    public function RegisterHook()
    {
        $this->oUserCurrent=$this->User_GetUserCurrent();

        if (!$this->oUserCurrent and !Config::Get('plugin.skmapsimple.show_guests')){
            $this->bShowMap = false;
        }

        $this->AddHook('template_form_add_topic_topic_end','FormMapEdit');
        $this->AddHook('template_form_add_topic_photoset_end','FormMapEdit');
        $this->AddHook('template_form_add_topic_question_end','FormMapEdit');
        $this->AddHook('template_form_add_topic_link_end','FormMapEdit');
        $this->AddHook('topic_edit_before','TopicAddExtraField');
        $this->AddHook('topic_add_before','TopicAddExtraField');
        

        if ($this->bShowMap) $this->AddHook('template_html_head_end','InsertApi');   
        $this->AddHook('template_topic_content_end','InsertMap');         
    }

    public function FormMapEdit(){
        return $this->Viewer_Fetch(Plugin::GetTemplatePath(__CLASS__) . 'hook_form_add_topic_topic_end.tpl');
    }

    public function InsertApi(){
        return $this->Viewer_Fetch(Plugin::GetTemplatePath(__CLASS__) . 'hook_googleapi_insert.tpl');
    }

    public function InsertMap($data){
        $this->oUserCurrent=$this->User_GetUserCurrent();

        if (!$this->oUserCurrent and !Config::Get('plugin.skmapsimple.show_guests')){
            $this->bShowMap = false;
        }

        $this->Viewer_Assign('oTopic',$data['topic']);
        $this->Viewer_Assign('bShowMap',$this->bShowMap);
        return $this->Viewer_Fetch(Plugin::GetTemplatePath(__CLASS__) . 'hook_insert_map.tpl');
    }

    public function TopicAddExtraField(&$data){
        $sCoord = trim(getRequest('topic_skmapcord'),'()');

        if ($sCoord!= '' and !preg_match("/^([0-9]*\.[0-9]*),[ ]?([0-9]*\.[0-9]*)$/", $sCoord) ){
            return;
        }

        $oTopic = $data['oTopic'];
        $oTopic->setSkmapcoord($sCoord);
    }
}
?>
