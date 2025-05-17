# JENS游戏合集

JENS游戏合集是一个包含四款经典小游戏的Web应用，支持用户注册、登录、游戏记录保存和排行榜功能。项目采用前后端分离架构，提供了流畅的游戏体验和完善的用户系统。

## 游戏列表

- **推箱子 (Sokoban)**：经典益智游戏，考验你的空间思维能力，包含多个精心设计的关卡
- **俄罗斯方块 (Tetris)**：风靡全球的俄罗斯方块，挑战你的反应能力，支持多种难度级别
- **贪吃蛇 (Snake)**：控制小蛇吃食物，不断成长，可调整速度和网格大小
- **坦克大战 (Tank)**：经典坦克射击游戏，保卫基地，提供经典模式和生存模式

## 系统要求

- **浏览器**：Chrome 80+、Firefox 72+、Safari 13+、Edge 79+
- **后端**：Python 3.8+、MySQL 5.7+
- **前端**：Node.js 14+

## 项目结构

```
jens_sgame/
├── jens-frontend/     # 前端代码
│   ├── src/
│   │   ├── api/       # API接口
│   │   ├── assets/    # 静态资源
│   │   ├── components/# 公共组件
│   │   ├── router/    # 路由配置
│   │   ├── store/     # Vuex状态管理
│   │   ├── utils/     # 工具函数
│   │   ├── views/     # 页面组件
│   │   │   └── games/ # 游戏组件
│   │   └── main.js    # 入口文件
│   ├── public/        # 公共资源
│   └── package.json   # 依赖配置
├── jens-backend/      # 后端代码
│   ├── app/
│   │   ├── models/    # 数据模型
│   │   ├── routes/    # API路由
│   │   ├── services/  # 业务逻辑
│   │   ├── __init__.py # Flask应用初始化
│   │   └── config.py  # 配置文件
│   ├── API_REFERENCE.md # API文档
│   └── run.py         # 启动脚本
├── database/          # 数据库相关
│   └── schema.sql     # 数据库结构
├── requirements.txt   # Python依赖
├── update.md          # 项目更新日志
└── README.md          # 项目说明
```

## 功能特性

### 用户功能
- 用户注册和登录 (支持JWT认证)
- 个人信息管理 (修改头像、密码等)
- 游戏设置管理 (自定义游戏偏好)
- 游戏记录查询 (查看历史成绩)

### 游戏功能
- **推箱子**：
  - 多关卡设计，5+精心设计的关卡
  - 支持撤销操作，关卡选择
  - 游戏进度自动保存
  - 完成时间和步数记录
  - 关卡完成提示

- **俄罗斯方块**：
  - 多种难度级别
  - 方块预览功能
  - 分数和消除行数记录
  - 可自定义下落速度

- **贪吃蛇**：
  - 多种速度选择
  - 可调整网格大小
  - 障碍物模式
  - 多种食物类型
  - 游戏状态保存

- **坦克大战**：
  - 经典模式和生存模式
  - 可调整敌人数量
  - 多种地图设计
  - 武器升级系统

### 社区功能
- 游戏排行榜（按游戏类型、得分、完成时间等）
- 成绩记录与分享
- 个人游戏数据统计

## 技术栈

### 前端
- **框架**：Vue 3
- **状态管理**：Vuex 4
- **路由**：Vue Router 4
- **UI组件库**：Element Plus
- **HTTP客户端**：Axios
- **构建工具**：Vite

### 后端
- **框架**：Flask
- **数据库**：MySQL
- **ORM**：SQLAlchemy
- **认证**：JWT (JSON Web Token)
- **API文档**：自定义Markdown文档

## 安装与运行

### 前端

```bash
# 进入前端目录
cd jens-frontend

# 安装依赖
npm install

# 开发模式运行
npm run serve

# 构建生产版本
npm run build
```

### 后端

```bash
# 进入后端目录
cd jens-backend

# 创建虚拟环境
python -m venv venv

# 激活虚拟环境
# Windows
venv\Scripts\activate
# Linux/macOS
source venv/bin/activate

# 安装依赖
pip install -r requirements.txt

# 配置数据库
# 1. 创建MySQL数据库
加载运行数据库文件：jens_sgame\database\
# 2. 导入数据库结构
修改jens-backend\app\config.py中的
    SQLALCHEMY_DATABASE_URI = os.environ.get('DATABASE_URI', 'mysql+pymysql://你的数据库用户:你的数据库密码@localhost/jens_sgame')

# 启动服务器
python run.py
```


## 游戏预览

### 推箱子
推箱子是一款考验空间思维能力的益智游戏，玩家需要将所有箱子推到指定位置。
- 多个精心设计的关卡
- 支持撤销操作
- 记录完成时间和步数
- 自动存档功能

### 俄罗斯方块
经典的俄罗斯方块游戏，体验消除方块的乐趣。
- 多种难度级别
- 方块预览功能
- 分数和消除行数记录
- 可自定义下落速度

### 贪吃蛇
控制蛇移动吃食物，不断成长的休闲游戏。
- 多种速度选择
- 可调整网格大小
- 障碍物模式
- 多种食物类型

### 坦克大战
经典的坦克射击游戏，保卫基地免受敌人攻击。
- 经典模式和生存模式
- 可调整敌人数量
- 多种地图设计
- 武器升级系统

## 常见问题

### 登录问题
- **问题**: 登录后无法保持登录状态
- **解决方案**: 检查浏览器是否启用了Cookies，JWT令牌需要存储在浏览器中

### 游戏保存问题
- **问题**: 游戏进度没有正确保存
- **解决方案**: 确保在游戏结束或暂停时点击保存按钮，或等待自动保存完成

### 兼容性问题
- **问题**: 在某些浏览器上游戏无法正常运行
- **解决方案**: 尝试使用最新版本的Chrome或Firefox浏览器

## 贡献指南

欢迎为项目做出贡献！请遵循以下步骤：

1. Fork本仓库
2. 创建你的特性分支 (`git checkout -b feature/amazingFeature`)
3. 提交你的更改 (`git commit -m 'Add some amazingFeature'`)
4. 推送到分支 (`git push origin feature/amazingFeature`)
5. 创建一个Pull Request

## 许可证

本项目采用MIT许可证 - 详情请查看LICENSE文件

## 联系方式

项目作者: JENS
邮箱：jenkens@qq.com
github:https://github.com/jenkenssq

## 致谢

- 感谢所有为这个项目做出贡献的开发者
- 特别感谢[Element Plus](https://element-plus.org/)提供的UI组件库
- 灵感来源于经典游戏 