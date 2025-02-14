package com.datn_phonestore.reponsitory;


import com.datn_phonestore.dto.user.identity.*;
import com.datn_phonestore.dto.user.request.UpdateUserRequest;
import feign.QueryMap;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@FeignClient(name = "identity-client", url = "${idp.url}")
public interface IdentityClient {
    @PostMapping(value = "/realms/keycloak_demo/protocol/openid-connect/token",
            consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    TokenExchangeResponse exchangeToken(@QueryMap TokenExchangeParam param);

    @PostMapping(value = "/realms/keycloak_demo/protocol/openid-connect/token",
            consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    TokenExchangeResponse exchangeTokenLogin(@QueryMap TokenLoginExchangeParam param);

    @PostMapping(value = "/admin/realms/keycloak_demo/users",
            consumes = MediaType.APPLICATION_JSON_VALUE)
    ResponseEntity<?> createUser(
            @RequestHeader("authorization") String token,
            @RequestBody UserCreationParam param);

    @PutMapping("/admin/realms/keycloak_demo/users/{id}")
    void updateUser(@RequestHeader("Authorization")String token,
                    @PathVariable("id") String userId,
                    @RequestBody UpdateUserRequest request);
    @PostMapping ("/admin/realms/keycloak_demo/users/{id}/logout")
    void logOut(@PathVariable("id") String Id);

    @GetMapping("/admin/realms/keycloak_demo/users")
    List<KeycloakUser> searchUser(
            @RequestHeader("Authorization") String bearerToken,
            @RequestParam("search") String username);

    @PutMapping("/admin/realms/keycloak_demo/users/{id}/send-verify-email")
    void sendmail(@RequestHeader("Authorization")String token,
                    @PathVariable("id") String userId);

}