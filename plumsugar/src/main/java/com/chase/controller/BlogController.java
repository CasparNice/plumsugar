package com.chase.controller;


import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.chase.common.api.CommonResult;
import com.chase.entity.Blog;
import com.chase.service.BlogService;
import com.chase.shiro.utils.ShiroUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.util.Assert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author chase
 * @since 2020-08-07
 */
@RestController
public class BlogController {

    @Autowired
    private BlogService blogService;

    @GetMapping("/blogs/{offset}/{limit}")
    public CommonResult list(@PathVariable("offset") int offset, @PathVariable("limit") int limit) {
        Page<Blog> page = new Page<>(offset, limit);
        IPage<Blog> iPage = blogService.lambdaQuery().page(page);
        return CommonResult.success(iPage);
    }

    @GetMapping("/blog/{id}")
    public CommonResult detail(@PathVariable("id") Long id) {
        Blog blog = blogService.getById(id);
        Assert.notNull(blog, "改博客已被删除");

        return CommonResult.success(blog);
    }

    @RequiresAuthentication
    @PostMapping("/blog/edit")
    public CommonResult edit(@Validated @RequestBody Blog blog) {
        Blog temp = null;
        if (blog.getId() != null) {
            temp = blogService.getById(blog.getId());
            //只能编辑自己的文章
            Assert.isTrue(temp.getUserId().equals(ShiroUtil.getProfile().getId()), "没有权限编辑");
        } else {
            temp = new Blog();
            temp.setUserId(ShiroUtil.getProfile().getId());
            temp.setCreated(LocalDateTime.now());
        }

        BeanUtil.copyProperties(blog, temp, "id", "userId", "created");
        blogService.saveOrUpdate(temp);

        return CommonResult.success(null);
    }

}

