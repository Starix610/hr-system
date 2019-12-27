package com.hrsystem.mapper;

import com.hrsystem.pojo.User;
import java.util.List;

public interface UserMapper {

    User selectByPrimaryKey(String username);

}