<template>
  <div class="Edit">
    <el-form ref="blogData" :model="blogData" :rules="rules" label-width="100px" class="demo-ruleForm">
      <el-form-item label="标题" prop="title">
        <el-input v-model="blogData.title" />
      </el-form-item>
      <el-form-item label="摘要" prop="description">
        <el-input v-model="blogData.description" type="textarea" />
      </el-form-item>

      <markdown-editor v-model="blogData.content" />

      <el-form-item style="margin: 40px; float: right">
        <el-button type="success" @click="submitForm('blogData')">发布</el-button>
        <el-button type="info">保存</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import MarkdownEditor from '@/components/MarkdownEditor'
import 'highlight.js/styles/github.css' // 语法高亮
import { getToken } from '@/utils/auth'

export default {
  components: { MarkdownEditor },
  data() {
    return {
      blogData: {
        id: '',
        title: '',
        description: '',
        content: '',
        status: 0
      },
      rules: {
        title: [
          { required: true, message: '标题不能为空', trigger: 'blur' },
          { min: 1, max: 25, message: '长度在 1 到 25 个字符', trigger: 'blur' }
        ]
      }
    }
  },
  created() {
    const blogId = this.$route.params.id
    if (blogId) {
      this.axios.get('http://localhost:8081/blog/' + blogId).then(response => {
        const blog = response.data.data
        this.blogData.id = blog.id
        this.blogData.title = blog.title
        this.blogData.description = blog.description
        this.blogData.content = blog.content
        this.blog.status = blog.status
      })
    }
  },
  methods: {
    submitForm(formName) {
      this.$refs[formName].validate(valid => {
        if (valid) {
          this.blogData.status = 1
          console.log(this.blogData)
          this.axios
            .post('http://localhost:8081/blog/edit', this.blogData, {
              headers: {
                Authorization: getToken()
              }
            })
            .then(response => {
              if (response.data.code === 200) {
                this.$message({
                  message: '添加成功',
                  type: 'success'
                })
                this.timer = setInterval(() => {
                  this.$router.push('/example/article')
                }, 1000)
              }
            })
            .catch(error => {
              this.$message.error('没有权限编辑')
            })
        } else {
          console.log('提交失败！')
          return false
        }
      })
    },
    resetForm(formName) {
      this.$refs[formName].resetFields()
    }
  }
}
</script>
