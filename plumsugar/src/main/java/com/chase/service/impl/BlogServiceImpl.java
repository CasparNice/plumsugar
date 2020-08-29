package com.chase.service.impl;

import com.chase.entity.Blog;
import com.chase.mapper.BlogMapper;
import com.chase.service.BlogService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author chase
 * @since 2020-08-07
 */
@Service
public class BlogServiceImpl extends ServiceImpl<BlogMapper, Blog> implements BlogService {

}
