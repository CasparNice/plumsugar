<template>
  <div class="dashboard-container">
    <el-row>
      <el-col :span="8" style="margin-left: 100px">
        <el-card :body-style="{ padding: '0px' }">
          <img src="https://pic1.zhimg.com/80/v2-a5c964461cc083bd0fe19f5a972b601d_720w.jpg" class="image" />
          <div style="padding: 14px;">
            <span>热爱可抵岁月漫长</span>
            <div class="bottom clearfix">
              <time class="time">{{ currentDate }}</time>
              <el-button type="text" class="button">操作按钮</el-button>
            </div>
          </div>
        </el-card>
      </el-col>
      <el-col :span="8" style="margin-left: 100px">
        <el-card :body-style="{ padding: '0px' }">
          <img src="https://pic4.zhimg.com/80/v2-1b7f4df090c9651149262db6ec7e30f2_720w.jpg" class="image" />
          <div style="padding: 14px;">
            <span>一定要站在你所热爱的世界里闪闪发光</span>
            <div class="bottom clearfix">
              <time class="time">{{ currentDate }}</time>
              <el-button type="text" class="button">操作按钮</el-button>
            </div>
          </div>
        </el-card>
      </el-col>
    </el-row>
    <el-row class="row-two">
      <el-col :span="8" style="margin-left: 100px">
        <el-card :body-style="{ padding: '0px' }">
          <img src="https://pic1.zhimg.com/80/v2-d80a8572ad3678af7c6f5781d50e3368_720w.jpg" class="image" />
          <div style="padding: 14px;">
            <span>知足且坚定，温柔且上进</span>
            <div class="bottom clearfix">
              <time class="time">{{ currentDate }}</time>
              <el-button type="text" class="button">操作按钮</el-button>
            </div>
          </div>
        </el-card>
      </el-col>
      <el-col :span="8" style="margin-left: 100px">
        <el-card :body-style="{ padding: '0px' }">
          <img src="https://pic4.zhimg.com/80/v2-2a003359526e95d514625645a11624f9_720w.jpg" class="image" />
          <div style="padding: 14px;">
            <span>撑住，才有后来的一切</span>
            <div class="bottom clearfix">
              <time class="time">{{ currentDate }}</time>
              <el-button type="text" class="button">操作按钮</el-button>
            </div>
          </div>
        </el-card>
      </el-col>
    </el-row>
    <el-row class="row-two">
      <el-col :span="8" style="margin-left: 100px">
        <el-card :body-style="{ padding: '0px' }">
          <img src="https://pic2.zhimg.com/80/v2-dee9b84e9991de8fe48e1e53155636fd_720w.jpg" class="image" />
          <div style="padding: 14px;">
            <span>向着月亮出发，即使不能到达，也能站在群星之中</span>
            <div class="bottom clearfix">
              <time class="time">{{ currentDate }}</time>
              <el-button type="text" class="button">操作按钮</el-button>
            </div>
          </div>
        </el-card>
      </el-col>
      <el-col :span="8" style="margin-left: 100px">
        <el-card :body-style="{ padding: '0px' }">
          <img src="https://pic2.zhimg.com/80/v2-3b5d22663fa4d5345ce5130ebff88a65_720w.jpg" class="image" />
          <div style="padding: 14px;">
            <span>暮冬时烤雪，迟夏写长信，早春不过一棵树</span>
            <div class="bottom clearfix">
              <time class="time">{{ currentDate }}</time>
              <el-button type="text" class="button">操作按钮</el-button>
            </div>
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  name: 'Dashboard',
  data() {
    return {
      currentDate: new Date()
    }
  }
}
</script>

<style lang="scss" scoped>
.dashboard {
  &-container {
    margin: 30px;
  }
  &-text {
    font-size: 30px;
    line-height: 46px;
  }
}

.time {
  font-size: 13px;
  color: #999;
}

.bottom {
  margin-top: 13px;
  line-height: 12px;
}

.button {
  padding: 0;
  float: right;
}

.image {
  width: 100%;
  display: block;
}

.clearfix:before,
.clearfix:after {
  display: table;
  content: '';
}

.clearfix:after {
  clear: both;
}

.row-two {
  margin-top: 50px;
}
</style>
