function echo_recv_cmd(s, msg)
    print(msg[1])
    print(msg[2])
    print(msg[3])

    local body = msg[4]
    print(body.name)
    print(body.age)
    print(body.email)

    -- send cmd to client
    local to_client = { 1, 2, 0, { status = 200 } }
    session.send_msg(s, to_client)
end

function echo_session_disconnect(s)
    local ip, port = Session.get_address(s)
    print("client disconnect "..ip.." : "..port)
end

local echo_service = {
    on_session_recv_cmd = echo_recv_cmd,
    on_session_disconnect = echo_session_disconnect,
}

local echo_server = {
    stype = 1,
    service = echo_service,
}

return echo_server