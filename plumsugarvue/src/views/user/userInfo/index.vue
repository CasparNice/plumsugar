<template>
  <div class="userManage" vfor>
    <el-col :span="8" v-for="(user, index) in items" :key="user" :offset="index > 0 ? 2 : 0">
      <el-card class="box-card">
        <div class="text item">
          <span>用户名：{{ user.username }}</span>
          <el-avatar :size="70" src="https://empty" @error="errorHandler" class="avatar">
            <img :src="user.avatar" />
          </el-avatar>
        </div>
        <div class="text item">邮 箱：{{ user.email }}</div>
        <div class="text item">创建时间：{{ user.created }}</div>
        <div class="text item">
          是否启用：
          <el-switch v-model="value" active-color="#13ce66" inactive-color="#ff4949"></el-switch>
        </div>
        <div class="text item">
          权 限：
          <el-tag type="success" v-if="user.status == 0">超级管理员</el-tag>
          <el-tag type="success" v-if="user.status == 1">管理员</el-tag>
          <el-tag type="success" v-if="user.status == 2">普通用户</el-tag>
          <el-dropdown @command="handleCommand" style="margin-left: 50px">
            <span class="el-dropdown-link">
              权限修改
              <i class="el-icon-arrow-down el-icon--right"></i>
            </span>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item command="0">超级管理员</el-dropdown-item>
              <el-dropdown-item command="1">管理员</el-dropdown-item>
              <el-dropdown-item command="2">普通用户</el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown>
        </div>
      </el-card>
    </el-col>
  </div>
</template>

<script>
import { getToken } from '@/utils/auth'

export default {
  name: 'userManage',
  data() {
    return {
      items: [],
      value: true
    }
  },
  components: {},
  created() {
    this.axios
      .get('http://localhost:8081/user/list', {
        headers: {
          Authorization: getToken()
        }
      })
      .then(response => {
        this.items = response.data.data
      })
  },
  mounted() {},
  methods: {
    errorHandler() {
      return true
    },
    handleCommand(command) {
      this.$message('click on item ' + command + '--因为懒我还没写这一页的功能哈哈')
      this.user.status = command
    }
  }
}
</script>
<style lang="scss" scoped>
.text {
  font-size: 14px;
}

.item {
  padding: 18px 0;
}

.box-card {
  width: 480px;
  margin: 40px;
}

.avatar {
  float: right;
  margin-right: 8%;
}

el-dropdown-link {
  cursor: pointer;
  color: #409eff;
}
.el-icon-arrow-down {
  font-size: 12px;
}
</style>
