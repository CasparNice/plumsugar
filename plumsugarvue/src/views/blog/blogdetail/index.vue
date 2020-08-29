<template>
  <div class="detail">
    <el-backtop :visibility-height="60">
      <i class="el-icon-caret-top" />
    </el-backtop>
    <h2 align="center">{{ blog.title }}</h2>
    <el-divider />
    <div class="markdown-body" v-html="blog.content" />
    <router-link :to="'/example/blog/edit/' + blog.id">
      <el-button v-if="isShow" type="primary" icon="el-icon-edit" circle class="edit" />
    </router-link>
  </div>
</template>

<script>
import 'github-markdown-css/github-markdown.css'

export default {
  name: 'Detail',
  components: {},
  data() {
    return {
      blog: {
        id: '',
        title: '',
        content: ''
      },
      isShow: false
    }
  },
  created() {
    const blogId = this.$route.params.id
    if (blogId) {
      this.axios.get('http://localhost:8081/blog/' + blogId).then(response => {
        const article = response.data.data
        this.blog.id = article.id
        this.blog.title = article.title
        const markdown = require('markdown-it')
        const result = new markdown().render(article.content)
        this.blog.content = result
        this.isShow = article.userId === onlyId
      })
    }
  },
  mounted() {},
  methods: {}
}
</script>
<style lang="scss" scoped>
.detail {
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
  margin: 10px;
  min-height: 650px;
  padding: 20px 15px;
}

.edit {
  position: fixed;
  display: flex;
  flex-direction: column;
  right: 42px;
  bottom: 100px;
}
</style>
