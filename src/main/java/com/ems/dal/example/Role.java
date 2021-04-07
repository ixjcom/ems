package com.ems.dal.example;

import java.io.Serializable;
import java.util.List;

public class Role implements Serializable {
    private Long id;

    private String name;

    private String permissions;

    private List<String> permissionCodes;//权限列表

    private static final long serialVersionUID = 1L;

    public List<String> getPermissionCodes() {
        return permissionCodes;
    }

    public void setPermissionCodes(List<String> permissionCodes) {
        this.permissionCodes = permissionCodes;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPermissions() {
        return permissions;
    }

    public void setPermissions(String permissions) {
        this.permissions = permissions;
    }
}