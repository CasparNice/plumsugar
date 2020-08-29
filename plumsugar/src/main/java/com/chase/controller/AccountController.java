package com.chase.controller;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.map.MapUtil;
import cn.hutool.crypto.SecureUtil;
import com.chase.common.api.CommonResult;
import com.chase.dto.LoginDto;
import com.chase.entity.User;
import com.chase.service.UserService;
import com.chase.shiro.utils.JwtTokenUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;

@RestController
public class AccountController {

    @Autowired
    private UserService userService;

    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    //补充以下，我现在只写了用户名登录但是正常情况下还可以邮箱登录到时候再补上！！！！！！！！！
    @PostMapping("/login")
    public CommonResult login(@Validated @RequestBody LoginDto loginDto, HttpServletResponse response) {
        User user = userService.lambdaQuery().eq(User::getUsername, loginDto.getUsername()).one();
        Assert.notNull(user, "用户不存在");

        if (!user.getPassword().equals(SecureUtil.md5(loginDto.getPassword()))) {
            return CommonResult.validateFailed("密码不正确");
        }
        String jwt = jwtTokenUtil.generateToken(user.getId());

        response.setHeader("Authorization", jwt);
        response.setHeader("Access-control-Expose-Headers", "Authorization");

        return CommonResult.success(MapUtil.builder()
                .put("id", user.getId())
                .put("username", user.getUsername())
                .put("avatar", user.getAvatar())
                .put("email", user.getEmail())
                .put("token", jwt)
                .map());
    }

    @GetMapping("/info")
    public CommonResult info(@RequestParam("token") String token) {
        System.out.println(token);
        if (token == null) {
            return CommonResult.failed("获取信息失败");
        }
        long userId = Long.parseLong(jwtTokenUtil.getUserIdFromToken(token));
        User user = userService.getById(userId);

        return CommonResult.success(user);
    }

    @RequiresAuthentication
    @GetMapping("/logout")
    public CommonResult logout() {
        SecurityUtils.getSubject().logout();

        return CommonResult.success(null);
    }
}
