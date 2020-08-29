package com.chase.controller;


import cn.hutool.crypto.SecureUtil;
import com.chase.common.api.CommonResult;
import com.chase.entity.User;
import com.chase.service.UserService;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.time.LocalDateTime;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author chase
 * @since 2020-08-07
 */
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/getById/{id}")
    public CommonResult get(@PathVariable("id") Long id) {
        return CommonResult.success(userService.getById(id));
    }

    @RequiresAuthentication
    @GetMapping("/list")
    public CommonResult index() {
        return CommonResult.success(userService.list());
    }

    @RequiresAuthentication
    @PostMapping("/save")
    public CommonResult save(@Validated @RequestBody User user) {
        user.setPassword(SecureUtil.md5(user.getPassword()));
        user.setRole("user");
        user.setStatus(0);
        user.setCreated(LocalDateTime.now());
        user.setAvatar("https://pic1.zhimg.com/80/v2-f1b170909b5a5991a533340ef70d36f8_720w.jpg");
        userService.save(user);
        return CommonResult.success(null);
    }

    @RequiresAuthentication
    @PutMapping("/updatePassword")
    public CommonResult updatePassword(@RequestBody User user) {
        String password = SecureUtil.md5(user.getPassword());
        boolean result = userService.getById(user.getId()).getPassword().equals(password);
        if (result) {
            return CommonResult.failed("新密码与原密码不能相同");
        }

        boolean update = userService.lambdaUpdate()
                .eq(User::getId, user.getId())
                .set(User::getPassword, password)
                .update();
        return update ? CommonResult.success(null) : CommonResult.failed("密码修改失败");
    }

    @RequiresAuthentication
    @PutMapping("/updateAvatar")
    public CommonResult updateAvatar(@RequestBody User user) {
        boolean update = userService.lambdaUpdate()
                .eq(User::getId, user.getId())
                .set(User::getAvatar, user.getAvatar())
                .update();
        return update ? CommonResult.success(null) : CommonResult.failed("头像上传失败");
    }

    @RequiresAuthentication
    @PutMapping("/updateEmail")
    public CommonResult updateEmail(@RequestBody User user) {
        String email = userService.getById(user.getId()).getEmail();
        boolean result = email != null && email.equals(user.getEmail());
        if (result) {
            return CommonResult.failed("要更新的邮箱与原来的一样");
        }

        boolean update = userService.lambdaUpdate()
                .eq(User::getId, user.getId())
                .set(User::getEmail, user.getEmail())
                .update();
        return update ? CommonResult.success(null) : CommonResult.success("邮箱更新失败");
    }

}

