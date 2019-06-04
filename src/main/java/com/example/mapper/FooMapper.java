package com.example.mapper;

public interface FooMapper {
  default String hello() {
    return "hello!";
  }
}
