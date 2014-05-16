<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
		<div class="container">
			<div class="row-fluid" id="logo-row">
				<div class="span4 info-columns text-right" id="left-text">
					<ul class="inline">
						<li>1401 Race Street,</li>
						<li>Cincinnati, OH 45202</li>
					</ul>
				</div>
				<div class="span4 text-center" id="center-logo">
					<a href="#!/home"> <img src="/resources/img/AnchorLarge.png" />
					</a>
				</div>
				<div class="span4 info-columns" id="right-text">
					<ul class="inline">
						<li>(513) 421-8111</li>
						<li>
							<ul class="hours">
                <li>Tue-Wed: 5-10</li>
                <li>Thurs: 11:30-2:30 and 5-10 </li>
								<li>Fri-Sat: 11:30-2:30 and 5-11</li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>

		<div class="container" id="main-menu">
			<div class="row-fluid visible-desktop hidden-phone hidden-tablet">
				<div class="container">
					<div class="span4">
						<ul class="inline text-right">
							<li ng-class="{active: $state.includes('menus')}"><a href=""
								ng-click="toggleMenu()">Menu</a></li>
							<li ui-route="/location"
								ng-class="{active: $state.includes('location')}"><a
								href="#!/location"> Location </a></li>
						</ul>
					</div>
					<div class="span4"></div>
					<div class="span4">
						<ul class="inline text-left">
							<li ui-route="/about"
								ng-class="{active: $state.includes('about')}" id="about-link">
								<a href="#!/about"> About </a>
							</li>
							<li ui-route="/reservation"
								ng-class="{active: $state.includes('reservation')}"><a
								href="#!/reservation" class="btn btn-primary btn-reserve"><i
									class="fa fa-cutlery"></i> Reservations </a></li>
						</ul>
					</div>
				</div>
			</div>
			
			<div class="row-fluid visible-phone visible-tablet hidden-desktop">
				<div class="container">
					<div class="span12" style="height:60px">
						<ul class="inline text-center thin">
							<li ng-class="{active: $state.includes('menus')}"><a href=""
								ng-click="toggleMenu()">Menu</a></li>
							<li ui-route="/location"
								ng-class="{active: $state.includes('location')}"><a
								href="#!/location"> Location </a></li>
							<li ui-route="/about"
								ng-class="{active: $state.includes('about')}" id="about-link">
								<a href="#!/about"> About </a>
							</li>
							<li ui-route="/reservation"
								ng-class="{active: $state.includes('reservation')}"><a
								href="#!/reservation" class="btn btn-primary btn-reserve"><i
									class="fa fa-cutlery"></i> Reservations </a></li>
						</ul>
					</div>
				</div>
			</div>
			
			
			<div id="submenu" class="row-fluid collapse"
				collapse="isCollapsed.val">
				<div class="container">
					<ul class="inline visible-desktop visible-tablet hidden-phone">
						<li ng-class="{active:$state.params.id==='lunch'}"><a
							href="#!/menus/lunch"> Lunch </a></li>
						<li ng-class="{active:$state.params.id==='dinner'}"><a
							href="#!/menus/dinner"> Dinner </a></li>
						<li ng-class="{active:$state.params.id==='wine'}"><a
							href="#!/menus/wine"> Wine List </a></li>
						<li ng-class="{active:$state.params.id==='cocktails'}"><a
							href="#!/menus/cocktails"> House Cocktails </a></li>
						<li ng-class="{active:$state.params.id==='happyHour'}"><a
							href="#!/menus/happyHour"> Happy Hour </a></li>
					</ul>
					
					<ul class="visible-phone hidden-tablet hidden-desktop">
						<li ng-class="{active:$state.params.id==='lunch'}"><a
							href="#!/menus/lunch"> Lunch </a></li>
						<li ng-class="{active:$state.params.id==='dinner'}"><a
							href="#!/menus/dinner"> Dinner </a></li>
						<li ng-class="{active:$state.params.id==='wine'}"><a
							href="#!/menus/wine"> Wine List </a></li>
						<li ng-class="{active:$state.params.id==='cocktails'}"><a
							href="#!/menus/cocktails"> House Cocktails </a></li>
						<li ng-class="{active:$state.params.id==='happyHour'}"><a
							href="#!/menus/happyHour"> Happy Hour </a></li>
					</ul>
					
				</div>
			</div>
			<div class="container" id="menu-border"></div>				
			<div ui-view="main"></div>
			<%@ include file="footer.jsp" %>

		</div>

