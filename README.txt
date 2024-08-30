import flitnet.sql in folder Database
npm install
node app.js


node_modules/: chứa các module Node.js được cài đặt thông qua npm.
public/: chứa các tài nguyên tĩnh như CSS, JavaScript, hình ảnh, v.v.
views/: chứa các tệp Handlebars templates cho các trang web.
views/layouts/: chứa layout main.
views/partials/: chứa các partial templates header,footer.
views/pages/: chứa các tệp Handlebars templates cho các trang cụ thể.
models/: chứa các tệp JavaScript cho định nghĩa các schema và model sử dụng trong MongoDB.
routes/: chứa các tệp JavaScript cho xử lý các yêu cầu từ người dùng và định tuyến chúng đến các controllers tương ứng.
app.js: tệp chính của ứng dụng Node.js, khởi tạo Express và MongoDB và định nghĩa các middleware và router cho ứng dụng.
package.json: tệp mô tả ứng dụng Node.js và liệt kê các module phụ thuộc cần thiết.