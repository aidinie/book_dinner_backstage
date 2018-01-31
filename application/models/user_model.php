<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class User_model extends CI_Model
{
    public function get_by_name_and_pwd($username, $password)
    {
        return $this->db->get_where('t_user', array('username' => $username, 'password' => $password))->row();
    }
    public function get_by_id($prod_id){
        $dish = $this->db->get_where('dish', array('did'=>$prod_id))->row();
        if($dish){
            echo json_encode($dish);
           // $this->load->view('single', array('dish'=>$dish_json));
        }
    }
    public function insertUser($name,$pass,$number,$sex){

        $data=array(
            'name' => $name,
            'password' => $pass,//建立一个用户名叫mary，密码为mary的数组，并传递给变量$data
            'phone'=> $number,
            'sex'=> $sex
//            'name' => 'nie',
//            'password' => '123',//建立一个用户名叫mary，密码为mary的数组，并传递给变量$data
//            'phone'=> '111',
//            'sex'=> '男'
        );
        $bool=$this->db->insert('user',$data);
        if($bool){
            $arr = array ('status' => 'success','number' => $number);
            echo json_encode($arr);
        }else{
            $arr = array ('status' => 'error');
            echo json_encode($arr);
        }

    }
    public function get_dishes_by_category($category){
        $dishes = $this->db->get_where('dish', array('category'=>$category))->result();
        if($dishes){
            echo json_encode($dishes);
        }

    }
}