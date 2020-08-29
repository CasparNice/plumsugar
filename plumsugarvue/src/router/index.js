import Vue from "vue";
import Router from "vue-router";

Vue.use(Router);

/* Layout */
import Layout from "@/layout";

/**
 * Note: sub-menu only appear when route children.length >= 1
 * Detail see: https://panjiachen.github.io/vue-element-admin-site/guide/essentials/router-and-nav.html
 *
 * hidden: true                   if set true, item will not show in the sidebar(default is false)
 * alwaysShow: true               if set true, will always show the root menu
 *                                if not set alwaysShow, when item has more than one children route,
 *                                it will becomes nested mode, otherwise not show the root menu
 * redirect: noRedirect           if set noRedirect will no redirect in the breadcrumb
 * name:'router-name'             the name is used by <keep-alive> (must set!!!)
 * meta : {
    roles: ['admin','editor']    control the page roles (you can set multiple roles)
    title: 'title'               the name show in sidebar and breadcrumb (recommend set)
    icon: 'svg-name'/'el-icon-x' the icon show in the sidebar
    breadcrumb: false            if set false, the item will hidden in breadcrumb(default is true)
    activeMenu: '/example/list'  if set path, the sidebar will highlight the path you set
  }
 */

/**
 * constantRoutes
 * a base page that does not have permission requirements
 * all roles can be accessed
 */
export const constantRoutes = [
  {
    path: "/login",
    component: () => import("@/views/login/index"),
    hidden: true
  },

  {
    path: "/404",
    component: () => import("@/views/404"),
    hidden: true
  },

  {
    path: "/",
    component: Layout,
    redirect: "/dashboard",
    children: [
      {
        path: "dashboard",
        name: "Dashboard",
        component: () => import("@/views/dashboard/index"),
        meta: { title: "梅糖后台管理系统", icon: "dashboard" }
      }
    ]
  },

  {
    path: "/example",
    component: Layout,
    redirect: "/example/table",
    name: "Example",
    meta: { title: "文章管理", icon: "form" },
    children: [
      {
        path: "article",
        name: "Article",
        component: () => import("@/views/blog/article/index"),
        meta: { title: "博客列表", icon: "el-icon-document" }
      },
      {
        path: "blog/add",
        name: "BlogDetail",
        component: () => import("@/views/blog/blogedit/index"),
        meta: { title: "添加博客", icon: "el-icon-edit-outline" }
      },
      {
        path: "blog/detail/:id(\\d+)",
        name: "BlogDetail",
        component: () => import("@/views/blog/blogdetail/index"),
        meta: { title: "博客详情", icon: "tree" },
        hidden: true
      },
      {
        path: "blog/edit/:id(\\d+)",
        name: "BlogEdit",
        component: () => import("@/views/blog/blogedit/index"),
        meta: { title: "编辑博客", icon: "tree" },
        hidden: true
      }
    ]
  },

  {
    path: "/form",
    component: Layout,
    children: [
      {
        path: "index",
        name: "Form",
        component: () => import("@/views/form/index"),
        meta: { title: "用户信息", icon: "form" },
        hidden: true
      }
    ]
  },

  {
    path: "/userManage",
    component: Layout,
    children: [
      {
        path: "",
        name: "userManage",
        component: () => import("@/views/user/userManage/index"),
        meta: { title: "用户管理", icon: "el-icon-s-custom" }
      },

      {
        path: "userInfo",
        name: "userInfo",
        component: () => import("@/views/user/userInfo/index"),
        meta: { title: "用户信息", icon: "form" },
        hidden: true
      }
    ]
  },

  {
    path: "external-link",
    component: Layout,
    children: [
      {
        path: "https://github.com/CasparNice",
        meta: { title: "外部链接", icon: "link" }
      }
    ]
  },

  // 404 page must be placed at the end !!!
  { path: "*", redirect: "/404", hidden: true }
];

const createRouter = () =>
  new Router({
    // mode: 'history', // require service support
    scrollBehavior: () => ({ y: 0 }),
    routes: constantRoutes
  });

const router = createRouter();

// Detail see: https://github.com/vuejs/vue-router/issues/1234#issuecomment-357941465
export function resetRouter() {
  const newRouter = createRouter();
  router.matcher = newRouter.matcher; // reset router
}

export default router;
