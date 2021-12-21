<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Generalsetting_m extends MY_Model
{

    protected $_table_name = 'generalsetting';

    public function __construct()
    {
        parent::__construct();
    }

    public function get_generalsetting($array = null, $single = false)
    {
        return parent::get($array, $single);
    }

    public function get_order_by_generalsetting($wherearray = null, $array = null, $single = false)
    {
        return parent::get_order_by($wherearray, $array, $single);
    }

    public function get_single_generalsetting($wherearray = null, $array = null, $single = true)
    {
        return parent::get_single($wherearray, $array, $single);
    }

    public function insert_generalsetting($array)
    {
        return parent::insert($array);
    }

    public function update_generalsetting($data, $id = null)
    {
        return parent::update($data, $id);
    }

    public function delete_generalsetting($id)
    {
        return parent::delete($id);
    }

    public function insertorupdate_generalsetting($arrays)
    {
        if (calculate($arrays)) {
            foreach ($arrays as $optionkey => $optionvalue) {
                $optionvalue = str_replace("'", "\'", $optionvalue);
                $this->db->query("INSERT INTO generalsetting (optionkey, optionvalue) VALUES ('" . $optionkey . "', '" . $optionvalue . "') ON DUPLICATE KEY UPDATE optionkey='" . $optionkey . "' , optionvalue='" . $optionvalue . "'");
            }
        }
        return true;
    }

}
