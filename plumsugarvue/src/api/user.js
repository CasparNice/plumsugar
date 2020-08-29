import request from "@/utils/request";

export function login(data) {
  return request({
    url: "/login",
    method: "post",
    data
  });
}

export function getInfo(token) {
  return request({
    url: "/info",
    method: "get",
    params: { token }
  });
}

export function logout(token) {
  return request({
    url: "/logout",
    method: "get",
    //记录一下这里不能用config{headers:{Auth...}} request 法封装的时候不是这样写的
    headers: {
      Authorization: token
    }
  });
}
