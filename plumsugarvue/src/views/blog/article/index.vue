<template>
  <div class="app-container">
    <el-table :data="list" border fit highlight-current-row style="width: 100%">
      <el-table-column align="center" label="ID" width="80">
        <template slot-scope="scope">
          <span>{{ scope.row.id }}</span>
        </template>
      </el-table-column>

      <el-table-column align="center" label="Title" width="250">
        <template slot-scope="{ row }">
          <router-link :to="'/example/blog/detail/' + row.id" class="link-type">
            <span>{{ row.title }}</span>
          </router-link>
        </template>
      </el-table-column>

      <el-table-column width="180px" align="center" label="日期">
        <template slot-scope="scope">
          <span>{{ scope.row.created }}</span>
        </template>
      </el-table-column>

      <!-- <el-table-column width="120px" align="center" label="Author">
        <template slot-scope="scope">
          <span>{{ scope.row.author }}</span>
        </template>
      </el-table-column>-->

      <el-table-column align="center" class-name="status-col" label="Status" width="110">
        <template slot-scope="{ row }">
          <el-tag v-if="row.status == 1" type="success">{{ status[1] }}</el-tag>
          <el-tag v-if="row.status == 0" type="info">{{ status[0] }}</el-tag>
        </template>
      </el-table-column>

      <el-table-column label="描述">
        <template slot-scope="scope">
          <span>{{ scope.row.description }}</span>
        </template>
      </el-table-column>

      <el-table-column align="center" label="操作" width="120">
        <template slot-scope="scope">
          <router-link :to="'/example/blog/edit/' + scope.row.id">
            <el-button type="primary" size="small" icon="el-icon-edit">编辑</el-button>
          </router-link>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total > 0" :total="total" :page.sync="listQuery.page" :limit.sync="listQuery.limit" @pagination="getList" />
  </div>
</template>

<script>
// import { fetchList } from '@/api/article'
import Pagination from '@/components/Pagination' // Secondary package based on el-pagination

export default {
  name: 'ArticleList',
  components: { Pagination },
  filters: {
    statusFilter(status) {
      const statusMap = {
        published: 'success',
        draft: 'info',
        deleted: 'danger'
      }
      return statusMap[status]
    }
  },
  data() {
    return {
      list: [],
      total: 0,
      listQuery: {
        page: 1,
        limit: 20
      },
      status: ['未发布', '已发布']
    }
  },
  created() {
    this.getList()
  },
  methods: {
    getList() {
      this.axios.get('http://localhost:8081/blogs/' + this.listQuery.page + '/' + this.listQuery.limit).then(response => {
        if (response.data.code === 200) {
          this.list = response.data.data.records
          this.total = response.data.data.total
        }
      })
    }
  }
}
</script>

<style scoped>
.edit-input {
  padding-right: 100px;
}
.cancel-btn {
  position: absolute;
  right: 15px;
  top: 10px;
}
</style>
