--
-- PostgreSQL database dump
--

-- Dumped from database version 10.13
-- Dumped by pg_dump version 10.13

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.account_emailaddress OWNER TO postgres;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_emailaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailaddress_id_seq OWNER TO postgres;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


ALTER TABLE public.account_emailconfirmation OWNER TO postgres;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_emailconfirmation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailconfirmation_id_seq OWNER TO postgres;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: coupons_coupon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coupons_coupon (
    id integer NOT NULL,
    code character varying(50) NOT NULL,
    valid_from timestamp with time zone NOT NULL,
    valid_to timestamp with time zone NOT NULL,
    discount integer NOT NULL,
    active boolean NOT NULL
);


ALTER TABLE public.coupons_coupon OWNER TO postgres;

--
-- Name: coupons_coupon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coupons_coupon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coupons_coupon_id_seq OWNER TO postgres;

--
-- Name: coupons_coupon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coupons_coupon_id_seq OWNED BY public.coupons_coupon.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_flatpage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_flatpage (
    id integer NOT NULL,
    url character varying(100) NOT NULL,
    title character varying(200) NOT NULL,
    content text NOT NULL,
    enable_comments boolean NOT NULL,
    template_name character varying(70) NOT NULL,
    registration_required boolean NOT NULL
);


ALTER TABLE public.django_flatpage OWNER TO postgres;

--
-- Name: django_flatpage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_flatpage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_flatpage_id_seq OWNER TO postgres;

--
-- Name: django_flatpage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_flatpage_id_seq OWNED BY public.django_flatpage.id;


--
-- Name: django_flatpage_sites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_flatpage_sites (
    id integer NOT NULL,
    flatpage_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.django_flatpage_sites OWNER TO postgres;

--
-- Name: django_flatpage_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_flatpage_sites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_flatpage_sites_id_seq OWNER TO postgres;

--
-- Name: django_flatpage_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_flatpage_sites_id_seq OWNED BY public.django_flatpage_sites.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: eav_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.eav_attribute (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(50) NOT NULL,
    description character varying(256),
    datatype character varying(6) NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    required boolean NOT NULL,
    display_order integer NOT NULL,
    enum_group_id integer,
    CONSTRAINT eav_attribute_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.eav_attribute OWNER TO postgres;

--
-- Name: eav_attribute_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.eav_attribute_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.eav_attribute_id_seq OWNER TO postgres;

--
-- Name: eav_attribute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.eav_attribute_id_seq OWNED BY public.eav_attribute.id;


--
-- Name: eav_enumgroup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.eav_enumgroup (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.eav_enumgroup OWNER TO postgres;

--
-- Name: eav_enumgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.eav_enumgroup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.eav_enumgroup_id_seq OWNER TO postgres;

--
-- Name: eav_enumgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.eav_enumgroup_id_seq OWNED BY public.eav_enumgroup.id;


--
-- Name: eav_enumgroup_values; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.eav_enumgroup_values (
    id integer NOT NULL,
    enumgroup_id integer NOT NULL,
    enumvalue_id integer NOT NULL
);


ALTER TABLE public.eav_enumgroup_values OWNER TO postgres;

--
-- Name: eav_enumgroup_values_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.eav_enumgroup_values_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.eav_enumgroup_values_id_seq OWNER TO postgres;

--
-- Name: eav_enumgroup_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.eav_enumgroup_values_id_seq OWNED BY public.eav_enumgroup_values.id;


--
-- Name: eav_enumvalue; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.eav_enumvalue (
    id integer NOT NULL,
    value character varying(50) NOT NULL
);


ALTER TABLE public.eav_enumvalue OWNER TO postgres;

--
-- Name: eav_enumvalue_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.eav_enumvalue_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.eav_enumvalue_id_seq OWNER TO postgres;

--
-- Name: eav_enumvalue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.eav_enumvalue_id_seq OWNED BY public.eav_enumvalue.id;


--
-- Name: eav_value; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.eav_value (
    id integer NOT NULL,
    entity_id integer NOT NULL,
    value_text text,
    value_float double precision,
    value_int integer,
    value_date timestamp with time zone,
    value_bool boolean,
    generic_value_id integer,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    attribute_id integer NOT NULL,
    entity_ct_id integer NOT NULL,
    generic_value_ct_id integer,
    value_enum_id integer
);


ALTER TABLE public.eav_value OWNER TO postgres;

--
-- Name: eav_value_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.eav_value_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.eav_value_id_seq OWNER TO postgres;

--
-- Name: eav_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.eav_value_id_seq OWNED BY public.eav_value.id;


--
-- Name: orders_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders_order (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(254) NOT NULL,
    address character varying(250) NOT NULL,
    postal_code character varying(20) NOT NULL,
    city character varying(100) NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    paid boolean NOT NULL,
    coupon_id integer,
    discount integer NOT NULL
);


ALTER TABLE public.orders_order OWNER TO postgres;

--
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_order_id_seq OWNER TO postgres;

--
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders_order.id;


--
-- Name: orders_orderitem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders_orderitem (
    id integer NOT NULL,
    price numeric(10,2) NOT NULL,
    quantity integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    CONSTRAINT orders_orderitem_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.orders_orderitem OWNER TO postgres;

--
-- Name: orders_orderitem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_orderitem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_orderitem_id_seq OWNER TO postgres;

--
-- Name: orders_orderitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_orderitem_id_seq OWNED BY public.orders_orderitem.id;


--
-- Name: shop_brand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_brand (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    alias character varying(200) NOT NULL,
    slug character varying(50) NOT NULL,
    icon_field character varying(100)
);


ALTER TABLE public.shop_brand OWNER TO postgres;

--
-- Name: shop_brand_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shop_brand_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_brand_id_seq OWNER TO postgres;

--
-- Name: shop_brand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shop_brand_id_seq OWNED BY public.shop_brand.id;


--
-- Name: shop_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_category (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    alias character varying(200) NOT NULL,
    slug character varying(50) NOT NULL,
    icon_field character varying(100),
    alias_en character varying(200),
    alias_ru character varying(200),
    name_en character varying(250),
    name_ru character varying(250)
);


ALTER TABLE public.shop_category OWNER TO postgres;

--
-- Name: shop_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shop_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_category_id_seq OWNER TO postgres;

--
-- Name: shop_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shop_category_id_seq OWNED BY public.shop_category.id;


--
-- Name: shop_collection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_collection (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    alias character varying(200) NOT NULL,
    slug character varying(50) NOT NULL
);


ALTER TABLE public.shop_collection OWNER TO postgres;

--
-- Name: shop_collection_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shop_collection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_collection_id_seq OWNER TO postgres;

--
-- Name: shop_collection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shop_collection_id_seq OWNED BY public.shop_collection.id;


--
-- Name: shop_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_product (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    article character varying(250) NOT NULL,
    slug character varying(50) NOT NULL,
    description text NOT NULL,
    price numeric(10,2) NOT NULL,
    available boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    title_img character varying(100) NOT NULL,
    brand_id integer,
    categories_id integer,
    collection_id integer,
    subcategories_id integer,
    product_type_id integer,
    description_en text,
    description_ru text,
    name_en character varying(250),
    name_ru character varying(250)
);


ALTER TABLE public.shop_product OWNER TO postgres;

--
-- Name: shop_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shop_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_product_id_seq OWNER TO postgres;

--
-- Name: shop_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shop_product_id_seq OWNED BY public.shop_product.id;


--
-- Name: shop_productimg; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_productimg (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    image character varying(100) NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.shop_productimg OWNER TO postgres;

--
-- Name: shop_productimg_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shop_productimg_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_productimg_id_seq OWNER TO postgres;

--
-- Name: shop_productimg_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shop_productimg_id_seq OWNED BY public.shop_productimg.id;


--
-- Name: shop_value; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_value (
    id integer NOT NULL,
    value character varying(200) NOT NULL,
    product_id integer,
    properties_id integer,
    value_en character varying(200),
    value_ru character varying(200)
);


ALTER TABLE public.shop_value OWNER TO postgres;

--
-- Name: shop_productinstancepropertyvalue_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shop_productinstancepropertyvalue_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_productinstancepropertyvalue_id_seq OWNER TO postgres;

--
-- Name: shop_productinstancepropertyvalue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shop_productinstancepropertyvalue_id_seq OWNED BY public.shop_value.id;


--
-- Name: shop_producttype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_producttype (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    alias character varying(200) NOT NULL,
    slug character varying(50) NOT NULL,
    icon_field character varying(100),
    subcategories_id integer,
    alias_en character varying(200),
    alias_ru character varying(200),
    name_en character varying(250),
    name_ru character varying(250)
);


ALTER TABLE public.shop_producttype OWNER TO postgres;

--
-- Name: shop_producttype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shop_producttype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_producttype_id_seq OWNER TO postgres;

--
-- Name: shop_producttype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shop_producttype_id_seq OWNED BY public.shop_producttype.id;


--
-- Name: shop_property; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_property (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    alias character varying(200) NOT NULL,
    slug character varying(50) NOT NULL,
    alias_en character varying(200),
    alias_ru character varying(200),
    name_en character varying(200),
    name_ru character varying(200)
);


ALTER TABLE public.shop_property OWNER TO postgres;

--
-- Name: shop_property_product_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_property_product_type (
    id integer NOT NULL,
    property_id integer NOT NULL,
    producttype_id integer NOT NULL
);


ALTER TABLE public.shop_property_product_type OWNER TO postgres;

--
-- Name: shop_propertytype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shop_propertytype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_propertytype_id_seq OWNER TO postgres;

--
-- Name: shop_propertytype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shop_propertytype_id_seq OWNED BY public.shop_property.id;


--
-- Name: shop_propertytype_product_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shop_propertytype_product_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_propertytype_product_type_id_seq OWNER TO postgres;

--
-- Name: shop_propertytype_product_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shop_propertytype_product_type_id_seq OWNED BY public.shop_property_product_type.id;


--
-- Name: shop_subcategory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_subcategory (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    alias character varying(200) NOT NULL,
    slug character varying(50) NOT NULL,
    icon_field character varying(100),
    categories_id integer,
    alias_en character varying(200),
    alias_ru character varying(200),
    name_en character varying(250),
    name_ru character varying(250)
);


ALTER TABLE public.shop_subcategory OWNER TO postgres;

--
-- Name: shop_subcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shop_subcategory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_subcategory_id_seq OWNER TO postgres;

--
-- Name: shop_subcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shop_subcategory_id_seq OWNED BY public.shop_subcategory.id;


--
-- Name: account_emailaddress id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);


--
-- Name: account_emailconfirmation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: coupons_coupon id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupons_coupon ALTER COLUMN id SET DEFAULT nextval('public.coupons_coupon_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_flatpage id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_flatpage ALTER COLUMN id SET DEFAULT nextval('public.django_flatpage_id_seq'::regclass);


--
-- Name: django_flatpage_sites id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_flatpage_sites ALTER COLUMN id SET DEFAULT nextval('public.django_flatpage_sites_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: eav_attribute id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eav_attribute ALTER COLUMN id SET DEFAULT nextval('public.eav_attribute_id_seq'::regclass);


--
-- Name: eav_enumgroup id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eav_enumgroup ALTER COLUMN id SET DEFAULT nextval('public.eav_enumgroup_id_seq'::regclass);


--
-- Name: eav_enumgroup_values id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eav_enumgroup_values ALTER COLUMN id SET DEFAULT nextval('public.eav_enumgroup_values_id_seq'::regclass);


--
-- Name: eav_enumvalue id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eav_enumvalue ALTER COLUMN id SET DEFAULT nextval('public.eav_enumvalue_id_seq'::regclass);


--
-- Name: eav_value id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eav_value ALTER COLUMN id SET DEFAULT nextval('public.eav_value_id_seq'::regclass);


--
-- Name: orders_order id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_order ALTER COLUMN id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);


--
-- Name: orders_orderitem id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_orderitem ALTER COLUMN id SET DEFAULT nextval('public.orders_orderitem_id_seq'::regclass);


--
-- Name: shop_brand id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_brand ALTER COLUMN id SET DEFAULT nextval('public.shop_brand_id_seq'::regclass);


--
-- Name: shop_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_category ALTER COLUMN id SET DEFAULT nextval('public.shop_category_id_seq'::regclass);


--
-- Name: shop_collection id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_collection ALTER COLUMN id SET DEFAULT nextval('public.shop_collection_id_seq'::regclass);


--
-- Name: shop_product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_product ALTER COLUMN id SET DEFAULT nextval('public.shop_product_id_seq'::regclass);


--
-- Name: shop_productimg id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_productimg ALTER COLUMN id SET DEFAULT nextval('public.shop_productimg_id_seq'::regclass);


--
-- Name: shop_producttype id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_producttype ALTER COLUMN id SET DEFAULT nextval('public.shop_producttype_id_seq'::regclass);


--
-- Name: shop_property id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_property ALTER COLUMN id SET DEFAULT nextval('public.shop_propertytype_id_seq'::regclass);


--
-- Name: shop_property_product_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_property_product_type ALTER COLUMN id SET DEFAULT nextval('public.shop_propertytype_product_type_id_seq'::regclass);


--
-- Name: shop_subcategory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_subcategory ALTER COLUMN id SET DEFAULT nextval('public.shop_subcategory_id_seq'::regclass);


--
-- Name: shop_value id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_value ALTER COLUMN id SET DEFAULT nextval('public.shop_productinstancepropertyvalue_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
\.


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add Основа	7	add_basis
26	Can change Основа	7	change_basis
27	Can delete Основа	7	delete_basis
28	Can view Основа	7	view_basis
29	Can add Бренд	8	add_brand
30	Can change Бренд	8	change_brand
31	Can delete Бренд	8	delete_brand
32	Can view Бренд	8	view_brand
33	Can add Категория	9	add_category
34	Can change Категория	9	change_category
35	Can delete Категория	9	delete_category
36	Can view Категория	9	view_category
37	Can add Коллекция	10	add_collection
38	Can change Коллекция	10	change_collection
39	Can delete Коллекция	10	delete_collection
40	Can view Коллекция	10	view_collection
41	Can add Продукт	11	add_product
42	Can change Продукт	11	change_product
43	Can delete Продукт	11	delete_product
44	Can view Продукт	11	view_product
45	Can add Фотография товара	12	add_productimg
46	Can change Фотография товара	12	change_productimg
47	Can delete Фотография товара	12	delete_productimg
48	Can view Фотография товара	12	view_productimg
49	Can add Свойства	13	add_property
50	Can change Свойства	13	change_property
51	Can delete Свойства	13	delete_property
52	Can view Свойства	13	view_property
53	Can add Подкатегория	14	add_subcategory
54	Can change Подкатегория	14	change_subcategory
55	Can delete Подкатегория	14	delete_subcategory
56	Can view Подкатегория	14	view_subcategory
57	Can add attribute	15	add_attribute
58	Can change attribute	15	change_attribute
59	Can delete attribute	15	delete_attribute
60	Can view attribute	15	view_attribute
61	Can add enum group	16	add_enumgroup
62	Can change enum group	16	change_enumgroup
63	Can delete enum group	16	delete_enumgroup
64	Can view enum group	16	view_enumgroup
65	Can add enum value	17	add_enumvalue
66	Can change enum value	17	change_enumvalue
67	Can delete enum value	17	delete_enumvalue
68	Can view enum value	17	view_enumvalue
69	Can add value	18	add_value
70	Can change value	18	change_value
71	Can delete value	18	delete_value
72	Can view value	18	view_value
73	Can add product instance property value	19	add_productinstancepropertyvalue
74	Can change product instance property value	19	change_productinstancepropertyvalue
75	Can delete product instance property value	19	delete_productinstancepropertyvalue
76	Can view product instance property value	19	view_productinstancepropertyvalue
77	Can add Основа	20	add_producttype
78	Can change Основа	20	change_producttype
79	Can delete Основа	20	delete_producttype
80	Can view Основа	20	view_producttype
81	Can add Свойства	21	add_propertytype
82	Can change Свойства	21	change_propertytype
83	Can delete Свойства	21	delete_propertytype
84	Can view Свойства	21	view_propertytype
85	Can add Значение	19	add_value
86	Can change Значение	19	change_value
87	Can delete Значение	19	delete_value
88	Can view Значение	19	view_value
89	Can add site	22	add_site
90	Can change site	22	change_site
91	Can delete site	22	delete_site
92	Can view site	22	view_site
93	Can add email address	23	add_emailaddress
94	Can change email address	23	change_emailaddress
95	Can delete email address	23	delete_emailaddress
96	Can view email address	23	view_emailaddress
97	Can add email confirmation	24	add_emailconfirmation
98	Can change email confirmation	24	change_emailconfirmation
99	Can delete email confirmation	24	delete_emailconfirmation
100	Can view email confirmation	24	view_emailconfirmation
101	Can add order item	25	add_orderitem
102	Can change order item	25	change_orderitem
103	Can delete order item	25	delete_orderitem
104	Can view order item	25	view_orderitem
105	Can add order	26	add_order
106	Can change order	26	change_order
107	Can delete order	26	delete_order
108	Can view order	26	view_order
109	Can add coupon	27	add_coupon
110	Can change coupon	27	change_coupon
111	Can delete coupon	27	delete_coupon
112	Can view coupon	27	view_coupon
113	Can add flat page	28	add_flatpage
114	Can change flat page	28	change_flatpage
115	Can delete flat page	28	delete_flatpage
116	Can view flat page	28	view_flatpage
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
10	pbkdf2_sha256$180000$QgfVIvbuWi66$zH84qpANmIjiUWvYYGRMLueN7F5k/S5iK3CSRAjnrVU=	2020-08-18 19:41:39.440684+03	f	Danon			w1ldboyzz@yandex.ru	f	t	2020-08-18 15:16:33.726783+03
1	pbkdf2_sha256$180000$bGztD9LnzpLA$h5KVuD4wzVNCjcVqX45bGxMU6IjeRYXd9WhFkRX8SZg=	2020-09-10 13:14:07.150887+03	t	admin				t	t	2020-07-14 13:47:45.18835+03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: coupons_coupon; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupons_coupon (id, code, valid_from, valid_to, discount, active) FROM stdin;
1	Doomarket	2020-09-10 21:00:00+03	2020-09-21 09:00:00+03	10	t
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-07-14 14:02:54.733519+03	1	Apple	1	[{"added": {}}]	8	1
2	2020-07-14 14:03:42.447774+03	1	Iphone	1	[{"added": {}}]	10	1
3	2020-07-14 14:07:09.183595+03	1	Электроника	1	[{"added": {}}]	9	1
4	2020-07-14 14:08:33.627392+03	1	Телефоны и смарт-часы	1	[{"added": {}}]	14	1
5	2020-07-14 14:20:18.299694+03	1	Ширина100 - 100	1	[{"added": {}}]	13	1
6	2020-07-14 14:20:33.632233+03	2	Высота20 - 20	1	[{"added": {}}]	13	1
7	2020-07-14 14:20:55.841736+03	3	Длина100 - 100	1	[{"added": {}}]	13	1
8	2020-07-14 14:21:31.58418+03	4	Глубина100 - 100	1	[{"added": {}}]	13	1
9	2020-07-14 14:21:56.711876+03	1	Смартфон	1	[{"added": {}}]	7	1
10	2020-07-14 14:22:03.600283+03	1	Apple iPhone 11, 64 ГБ, черный	1	[{"added": {}}]	11	1
11	2020-07-14 14:24:16.528796+03	2	Watch	1	[{"added": {}}]	10	1
12	2020-07-14 14:27:42.43717+03	2	Смарт-часы	1	[{"added": {}}]	7	1
13	2020-07-14 14:27:56.196902+03	2	Apple Watch Series 5, 44 мм	1	[{"added": {}}]	11	1
14	2020-07-14 18:27:24.716223+03	2	Samsung	1	[{"added": {}}]	8	1
15	2020-07-14 18:27:51.69166+03	3	S	1	[{"added": {}}]	10	1
16	2020-07-14 18:28:43.66347+03	3	Samsung Galaxy S10+ 128 ГБ	1	[{"added": {}}]	11	1
17	2020-07-15 15:27:49.780527+03	1	<EnumValue 21>	1	[{"added": {}}]	17	1
18	2020-07-15 15:28:58.461455+03	1	<EnumGroup размер>	1	[{"added": {}}]	16	1
19	2020-07-15 15:29:34.770786+03	1	Ширина (Multiple Choice)	1	[{"added": {}}]	15	1
20	2020-07-15 15:29:40.290446+03	1	Ширина: "<EnumValue 21>" (Ширина100 - 100)	1	[{"added": {}}]	18	1
21	2020-07-15 16:38:17.250865+03	3	Высота (Целое)	1	[{"added": {}}]	15	1
22	2020-07-15 16:38:45.901535+03	1	Ширина: "<EnumValue 21>" (Ширина100 - 100)	3		18	1
23	2020-07-15 16:39:46.795911+03	2	Высота: "20" (Ширина (Multiple Choice))	1	[{"added": {}}]	18	1
24	2020-07-15 16:40:28.133919+03	2	Высота: "20" (Ширина (Multiple Choice))	2	[]	18	1
25	2020-07-15 17:31:19.310369+03	2	Высота: "20" (Width (Текст))	2	[{"changed": {"fields": ["Entity id"]}}]	18	1
26	2020-07-15 17:32:07.378454+03	2	Высота: "20" (Apple iPhone 11, 64 ГБ, черный)	2	[{"changed": {"fields": ["Entity ct", "Entity id"]}}]	18	1
27	2020-07-15 17:33:51.185748+03	2	<EnumValue Да>	1	[{"added": {}}]	17	1
28	2020-07-15 17:34:04.98686+03	2	<EnumGroup Кнопка>	1	[{"added": {}}]	16	1
29	2020-07-15 17:35:06.194427+03	3	<EnumValue Нет>	1	[{"added": {}}]	17	1
30	2020-07-15 17:35:32.996702+03	3	<EnumGroup Кнопка посередине>	1	[{"added": {}}]	16	1
31	2020-07-15 17:38:20.870614+03	4	кнопка посередине (Multiple Choice)	1	[{"added": {}}]	15	1
32	2020-07-15 17:39:59.677141+03	3	кнопка посередине: "None" (Apple iPhone 11, 64 ГБ, черный)	1	[{"added": {}}]	18	1
33	2020-07-15 17:40:18.887333+03	3	кнопка посередине: "<EnumValue Да>" (Apple iPhone 11, 64 ГБ, черный)	2	[{"changed": {"fields": ["Value bool", "Value enum"]}}]	18	1
34	2020-07-21 23:36:08.808752+03	1	Смартфоны	1	[{"added": {}}]	20	1
35	2020-07-21 23:36:14.643483+03	1	Ширина	1	[{"added": {}}]	21	1
36	2020-07-21 23:36:40.665934+03	1	21	1	[{"added": {}}]	19	1
37	2020-07-21 23:37:18.904139+03	2	31	1	[{"added": {}}]	19	1
38	2020-07-21 23:37:50.642531+03	1	Apple iPhone 11, 64 ГБ, черный	2	[{"changed": {"fields": ["\\u041e\\u0441\\u043d\\u043e\\u0432\\u0430"]}}]	11	1
39	2020-07-21 23:46:57.665596+03	3	Samsung Galaxy S10+ 128 ГБ	2	[{"changed": {"fields": ["\\u041e\\u0441\\u043d\\u043e\\u0432\\u0430"]}}]	11	1
40	2020-07-21 23:47:20.926999+03	2	Смарт-часы	1	[{"added": {}}]	20	1
41	2020-07-21 23:47:23.064221+03	2	Apple Watch Series 5, 44 мм	2	[{"changed": {"fields": ["\\u041e\\u0441\\u043d\\u043e\\u0432\\u0430"]}}]	11	1
42	2020-07-22 18:19:56.112412+03	2	31	2	[]	19	1
43	2020-07-22 18:21:56.488035+03	1	Ширина	2	[]	21	1
44	2020-07-22 18:22:20.775443+03	2	Глубина	1	[{"added": {}}]	21	1
45	2020-07-22 18:22:34.057009+03	3	Длина	1	[{"added": {}}]	21	1
46	2020-07-22 18:22:44.75344+03	4	Высота	1	[{"added": {}}]	21	1
47	2020-07-22 18:23:35.753473+03	3	50	1	[{"added": {}}]	19	1
48	2020-07-22 18:23:48.257147+03	4	36	1	[{"added": {}}]	19	1
49	2020-07-22 18:23:58.227983+03	5	1	1	[{"added": {}}]	19	1
50	2020-07-22 18:26:01.206298+03	1	Ширина	2	[{"changed": {"fields": ["\\u041e\\u0441\\u043d\\u043e\\u0432\\u0430"]}}]	21	1
51	2020-07-22 18:54:19.542341+03	4	Высота	2	[]	21	1
52	2020-07-22 18:59:40.690054+03	4	36	2	[{"changed": {"fields": ["\\u0421\\u0432\\u043e\\u0439\\u0441\\u0442\\u0432\\u043e"]}}]	19	1
53	2020-07-22 18:59:46.393008+03	5	1	2	[{"changed": {"fields": ["\\u0421\\u0432\\u043e\\u0439\\u0441\\u0442\\u0432\\u043e"]}}]	19	1
54	2020-07-22 18:59:52.151495+03	3	50	2	[{"changed": {"fields": ["\\u0421\\u0432\\u043e\\u0439\\u0441\\u0442\\u0432\\u043e"]}}]	19	1
55	2020-07-22 19:04:21.247308+03	2	31	2	[{"changed": {"fields": ["\\u0421\\u0432\\u043e\\u0439\\u0441\\u0442\\u0432\\u043e"]}}]	19	1
56	2020-07-22 19:04:56.961154+03	5	Толщина	1	[{"added": {}}]	21	1
57	2020-07-22 19:04:58.82496+03	1	21	2	[{"changed": {"fields": ["\\u0421\\u0432\\u043e\\u0439\\u0441\\u0442\\u0432\\u043e"]}}]	19	1
58	2020-07-22 20:50:45.423331+03	4	36	2	[{"changed": {"fields": ["\\u0421\\u0432\\u043e\\u0439\\u0441\\u0442\\u0432\\u043e", "\\u041f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0442"]}}]	19	1
59	2020-07-22 20:53:35.843108+03	5	Толщина	2	[]	13	1
60	2020-07-22 20:55:14.68731+03	5	Толщина	2	[]	13	1
61	2020-07-22 20:55:34.234451+03	5	1	2	[{"changed": {"fields": ["\\u0421\\u0432\\u043e\\u0439\\u0441\\u0442\\u0432\\u043e", "\\u041f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0442"]}}]	19	1
62	2020-07-22 20:56:37.325859+03	5	1	2	[{"changed": {"fields": ["\\u0421\\u0432\\u043e\\u0439\\u0441\\u0442\\u0432\\u043e"]}}]	19	1
63	2020-07-22 20:56:48.213201+03	4	36	2	[{"changed": {"fields": ["\\u0421\\u0432\\u043e\\u0439\\u0441\\u0442\\u0432\\u043e", "\\u041f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0442"]}}]	19	1
64	2020-07-22 20:56:56.67462+03	3	50	2	[{"changed": {"fields": ["\\u0421\\u0432\\u043e\\u0439\\u0441\\u0442\\u0432\\u043e", "\\u041f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0442"]}}]	19	1
65	2020-07-22 20:57:06.992046+03	2	31	2	[{"changed": {"fields": ["\\u0421\\u0432\\u043e\\u0439\\u0441\\u0442\\u0432\\u043e", "\\u041f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0442"]}}]	19	1
66	2020-07-22 20:57:16.365543+03	1	21	2	[{"changed": {"fields": ["\\u0421\\u0432\\u043e\\u0439\\u0441\\u0442\\u0432\\u043e", "\\u041f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0442"]}}]	19	1
67	2020-07-22 20:58:02.63273+03	5	Толщина	2	[]	13	1
68	2020-07-22 20:58:07.499248+03	4	Высота	2	[]	13	1
69	2020-07-22 20:58:12.070646+03	3	Длина	2	[]	13	1
70	2020-07-22 20:58:57.571297+03	5	1	2	[]	19	1
71	2020-07-22 21:02:20.217912+03	5	1	2	[{"changed": {"fields": ["\\u0421\\u0432\\u043e\\u0439\\u0441\\u0442\\u0432\\u043e"]}}]	19	1
72	2020-07-22 21:02:31.498364+03	4	36	2	[{"changed": {"fields": ["\\u0421\\u0432\\u043e\\u0439\\u0441\\u0442\\u0432\\u043e"]}}]	19	1
73	2020-07-22 21:02:45.127437+03	3	50	2	[{"changed": {"fields": ["\\u0421\\u0432\\u043e\\u0439\\u0441\\u0442\\u0432\\u043e"]}}]	19	1
74	2020-07-22 21:02:52.630235+03	2	31	2	[{"changed": {"fields": ["\\u0421\\u0432\\u043e\\u0439\\u0441\\u0442\\u0432\\u043e", "\\u041f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0442"]}}]	19	1
75	2020-07-22 21:03:02.278237+03	1	21	2	[{"changed": {"fields": ["\\u0421\\u0432\\u043e\\u0439\\u0441\\u0442\\u0432\\u043e", "\\u041f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0442"]}}]	19	1
76	2020-07-22 23:16:56.990126+03	1	Смартфоны	2	[{"changed": {"fields": ["\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435"]}}]	20	1
77	2020-07-22 23:17:04.298961+03	2	Смарт-часы	2	[{"changed": {"fields": ["\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435"]}}]	20	1
78	2020-07-23 12:29:17.917334+03	5	1	2	[{"changed": {"fields": ["\\u0421\\u0432\\u043e\\u0439\\u0441\\u0442\\u0432\\u043e", "\\u041f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0442"]}}]	19	1
79	2020-07-23 12:33:47.434548+03	1	Apple Watch Series 5, 44 мм	1	[{"added": {}}]	12	1
80	2020-07-23 12:34:42.618082+03	2	Samsung	1	[{"added": {}}]	12	1
81	2020-07-23 12:34:56.761082+03	3	Samsung	1	[{"added": {}}]	12	1
82	2020-07-24 14:23:26.990438+03	1	Ширина	2	[{"changed": {"fields": ["\\u041e\\u0441\\u043d\\u043e\\u0432\\u0430"]}}]	13	1
83	2020-07-24 14:52:57.115907+03	1	Ширина	2	[{"changed": {"fields": ["\\u041e\\u0441\\u043d\\u043e\\u0432\\u0430"]}}]	13	1
84	2020-07-24 14:54:38.019819+03	6	100	1	[{"added": {}}]	19	1
85	2020-07-24 16:06:22.990421+03	7	105	1	[{"added": {}}]	19	1
86	2020-07-24 17:27:32.959653+03	8	208	1	[{"added": {}}]	19	1
87	2020-07-24 17:28:45.498696+03	7	105	2	[{"changed": {"fields": ["\\u041f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0442"]}}]	19	1
88	2020-07-24 17:29:26.703011+03	7	105	3		19	1
89	2020-07-27 14:15:19.545426+03	9	105	1	[{"added": {}}]	19	1
90	2020-07-27 14:44:35.674166+03	1	Ширина	2	[{"changed": {"fields": ["\\u041e\\u0441\\u043d\\u043e\\u0432\\u0430"]}}]	13	1
91	2020-07-27 17:00:28.44646+03	5	1	3		19	1
92	2020-07-28 00:01:51.283374+03	5	Толщина	2	[{"changed": {"fields": ["\\u041e\\u0441\\u043d\\u043e\\u0432\\u0430"]}}]	13	1
93	2020-07-28 00:02:10.026874+03	5	Толщина	2	[]	13	1
94	2020-07-28 00:20:53.226926+03	9	105	2	[{"changed": {"fields": ["\\u041f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0442"]}}]	19	1
95	2020-07-28 00:47:20.92004+03	6	100	2	[]	19	1
96	2020-07-28 00:47:48.964931+03	5	Толщина	2	[{"changed": {"fields": ["\\u041e\\u0441\\u043d\\u043e\\u0432\\u0430"]}}]	13	1
97	2020-07-29 18:53:10.611479+03	5	Толщина	2	[{"changed": {"fields": ["\\u041e\\u0441\\u043d\\u043e\\u0432\\u0430"]}}]	13	1
98	2020-07-29 18:53:23.303933+03	5	Толщина	2	[{"changed": {"fields": ["\\u041e\\u0441\\u043d\\u043e\\u0432\\u0430"]}}]	13	1
99	2020-07-30 11:38:51.076431+03	4	MacBook	1	[{"added": {}}]	10	1
100	2020-07-30 11:41:10.616666+03	2	Ноутбуки, планшеты, электронные книги	1	[{"added": {}}]	14	1
101	2020-07-30 11:41:38.618565+03	3	Ноутбуки	1	[{"added": {}}]	20	1
102	2020-07-30 11:41:44.048182+03	4	Apple MacBook Pro 13	1	[{"added": {}}]	11	1
103	2020-07-30 11:42:31.006533+03	4	Apple	1	[{"added": {}}]	12	1
104	2020-07-30 11:42:55.381542+03	5	мак	1	[{"added": {}}]	12	1
105	2020-07-30 11:50:04.872737+03	6	Диагональ экрана	1	[{"added": {}}]	13	1
106	2020-07-30 11:50:37.526384+03	10	13.3"	1	[{"added": {}}]	19	1
107	2020-07-30 12:51:24.351772+03	6	Диагональ экрана	2	[]	13	1
108	2020-07-30 13:09:47.469526+03	3	Ноутбуки	2	[{"changed": {"fields": ["\\u0410\\u043b\\u0438\\u0430\\u0441"]}}]	20	1
109	2020-07-30 13:09:51.867899+03	3	Ноутбуки	2	[]	20	1
110	2020-07-30 13:09:55.812636+03	2	Смарт-часы	2	[]	20	1
111	2020-07-30 13:10:02.962508+03	1	Смартфоны	2	[{"changed": {"fields": ["\\u0410\\u043b\\u0438\\u0430\\u0441"]}}]	20	1
112	2020-07-30 13:27:35.455813+03	2	Бытовая техника	1	[{"added": {}}]	9	1
113	2020-08-03 23:03:56.744072+03	7	Длина браслета	1	[{"added": {}}]	13	1
114	2020-08-03 23:04:34.678656+03	11	150 см	1	[{"added": {}}]	19	1
115	2020-08-04 15:09:33.765146+03	5	A	1	[{"added": {}}]	10	1
116	2020-08-04 15:10:19.978103+03	5	SAMSUNG Galaxy A20	1	[{"added": {}}]	11	1
117	2020-08-04 15:11:44.553755+03	12	15	1	[{"added": {}}]	19	1
118	2020-08-04 15:11:54.02101+03	13	25	1	[{"added": {}}]	19	1
119	2020-08-04 15:12:03.693349+03	14	13	1	[{"added": {}}]	19	1
120	2020-08-04 15:14:25.848879+03	6	Samsung Galaxy S20 Ultra 128 Гб	1	[{"added": {}}]	11	1
121	2020-08-04 15:15:17.403619+03	15	55	1	[{"added": {}}]	19	1
122	2020-08-04 15:15:46.087897+03	16	20	1	[{"added": {}}]	19	1
123	2020-08-04 15:16:02.067889+03	17	14	1	[{"added": {}}]	19	1
124	2020-08-04 15:21:29.807005+03	6	Samsung Galaxy S20 Ultra 128 Гб	2	[{"changed": {"fields": ["\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435"]}}]	11	1
125	2020-08-04 17:54:24.253351+03	7	Apple iPhone 8	1	[{"added": {}}]	11	1
126	2020-08-04 17:54:44.919451+03	18	10	1	[{"added": {}}]	19	1
127	2020-08-04 17:54:54.433357+03	19	11	1	[{"added": {}}]	19	1
128	2020-08-04 17:55:04.012687+03	20	12	1	[{"added": {}}]	19	1
129	2020-08-06 16:27:20.274096+03	6	s10	1	[{"added": {}}]	12	1
130	2020-08-06 16:27:44.696687+03	7	s10	1	[{"added": {}}]	12	1
131	2020-08-06 16:28:30.027236+03	8	s10	1	[{"added": {}}]	12	1
132	2020-08-06 16:28:41.708746+03	9	s10	1	[{"added": {}}]	12	1
133	2020-08-06 18:17:19.151567+03	4	Apple MacBook Pro 13	2	[{"changed": {"fields": ["\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435"]}}]	11	1
134	2020-08-07 18:05:41.209239+03	2	Бытовая техника	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 \\u043a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u0438 [en]", "\\u0410\\u043b\\u0438\\u0430\\u0441 [en]"]}}]	9	1
135	2020-08-07 18:06:28.481303+03	1	Электроника	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 \\u043a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u0438 [en]", "\\u0410\\u043b\\u0438\\u0430\\u0441 [en]"]}}]	9	1
136	2020-08-07 18:06:55.054541+03	3	Ноутбуки	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 \\u043e\\u0441\\u043d\\u043e\\u0432\\u044b [en]", "\\u0410\\u043b\\u0438\\u0430\\u0441 [en]"]}}]	20	1
137	2020-08-07 18:07:18.996787+03	2	Смарт-часы	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 \\u043e\\u0441\\u043d\\u043e\\u0432\\u044b [en]", "\\u0410\\u043b\\u0438\\u0430\\u0441 [en]"]}}]	20	1
138	2020-08-07 18:07:36.85023+03	1	Смартфоны	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 \\u043e\\u0441\\u043d\\u043e\\u0432\\u044b [en]", "\\u0410\\u043b\\u0438\\u0430\\u0441 [en]"]}}]	20	1
139	2020-08-07 18:08:42.967659+03	2	Ноутбуки, планшеты, электронные книги	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 \\u043f\\u043e\\u0434\\u043a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u0438 [en]", "\\u0410\\u043b\\u0438\\u0430\\u0441 [en]"]}}]	14	1
140	2020-08-07 18:09:12.385199+03	1	Телефоны и смарт-часы	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 \\u043f\\u043e\\u0434\\u043a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u0438 [en]", "\\u0410\\u043b\\u0438\\u0430\\u0441 [en]"]}}]	14	1
141	2020-08-07 18:09:38.436655+03	7	Apple iPhone 8	2	[{"changed": {"fields": ["\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435 [en]"]}}]	11	1
142	2020-08-07 18:09:57.460741+03	1	Ширина	2	[{"changed": {"fields": ["\\u0421\\u0432\\u043e\\u0439\\u0441\\u0442\\u0432\\u043e [en]", "\\u0410\\u043b\\u0438\\u0430\\u0441 [en]"]}}]	13	1
143	2020-08-07 18:10:09.252167+03	2	Глубина	2	[{"changed": {"fields": ["\\u0421\\u0432\\u043e\\u0439\\u0441\\u0442\\u0432\\u043e [en]", "\\u0410\\u043b\\u0438\\u0430\\u0441 [en]"]}}]	13	1
144	2020-08-07 18:10:18.626494+03	3	Длина	2	[{"changed": {"fields": ["\\u0421\\u0432\\u043e\\u0439\\u0441\\u0442\\u0432\\u043e [en]", "\\u0410\\u043b\\u0438\\u0430\\u0441 [en]"]}}]	13	1
145	2020-08-07 18:10:31.856655+03	4	Высота	2	[{"changed": {"fields": ["\\u0421\\u0432\\u043e\\u0439\\u0441\\u0442\\u0432\\u043e [en]", "\\u0410\\u043b\\u0438\\u0430\\u0441 [en]"]}}]	13	1
146	2020-08-07 18:10:43.632603+03	5	Толщина	2	[{"changed": {"fields": ["\\u0421\\u0432\\u043e\\u0439\\u0441\\u0442\\u0432\\u043e [en]", "\\u0410\\u043b\\u0438\\u0430\\u0441 [en]"]}}]	13	1
147	2020-08-07 18:10:53.867441+03	6	Диагональ экрана	2	[{"changed": {"fields": ["\\u0421\\u0432\\u043e\\u0439\\u0441\\u0442\\u0432\\u043e [en]", "\\u0410\\u043b\\u0438\\u0430\\u0441 [en]"]}}]	13	1
148	2020-08-07 18:11:23.573598+03	7	Длина браслета	2	[{"changed": {"fields": ["\\u0421\\u0432\\u043e\\u0439\\u0441\\u0442\\u0432\\u043e [en]", "\\u0410\\u043b\\u0438\\u0430\\u0441 [en]"]}}]	13	1
149	2020-08-17 10:13:23.903911+03	8	Danon	3		4	1
150	2020-08-17 10:13:24.065234+03	2	den	3		4	1
151	2020-08-17 10:13:24.069136+03	5	den27	3		4	1
152	2020-08-17 10:13:24.074216+03	6	Denis	3		4	1
153	2020-08-17 10:13:24.079139+03	4	dennis	3		4	1
154	2020-08-17 10:13:24.081939+03	7	Денис	3		4	1
155	2020-08-18 14:48:32.413191+03	9	Danon	3		4	1
156	2020-08-18 18:12:24.721742+03	3	alberto	3		4	1
157	2020-08-18 18:12:24.742684+03	11	DDDD	3		4	1
158	2020-08-18 18:58:39.599149+03	15	asdasdas	3		4	1
159	2020-08-18 18:58:39.605133+03	14	dada	3		4	1
160	2020-08-18 18:58:39.608126+03	13	DD	3		4	1
161	2020-08-18 18:58:39.611117+03	12	DDDD	3		4	1
162	2020-08-31 19:31:45.197102+03	5	Заказ №5	3		26	1
163	2020-08-31 19:31:45.309409+03	4	Заказ №4	3		26	1
164	2020-08-31 19:31:45.312398+03	3	Заказ №3	3		26	1
165	2020-08-31 19:31:45.314392+03	2	Заказ №2	3		26	1
166	2020-08-31 19:31:45.316363+03	1	Заказ №1	3		26	1
167	2020-08-31 19:37:16.02834+03	9	Заказ №9	3		26	1
168	2020-08-31 19:37:22.538797+03	8	Заказ №8	3		26	1
169	2020-08-31 19:37:28.147176+03	7	Заказ №7	3		26	1
170	2020-08-31 19:50:38.788413+03	6	Заказ №6	3		26	1
171	2020-08-31 19:55:04.743733+03	11	Заказ №11	3		26	1
172	2020-08-31 19:55:04.752687+03	10	Заказ №10	3		26	1
173	2020-09-10 17:35:17.729422+03	1	Doomarket	1	[{"added": {}}]	27	1
174	2020-09-13 19:26:36.694196+03	1	/faq/ -- Как заказать	1	[{"added": {}}]	28	1
175	2020-09-13 19:36:07.563401+03	1	/faq/ -- Как заказать	2	[{"changed": {"fields": ["Template name"]}}]	28	1
176	2020-09-13 19:39:08.037677+03	1	/faq/ -- Как заказать	2	[{"changed": {"fields": ["Content"]}}]	28	1
177	2020-09-14 09:12:05.512447+03	1	/faq/ -- Как заказать	3		28	1
178	2020-09-14 09:28:14.800206+03	2	/tutorial/ -- Doomarket - Как заказать?	1	[{"added": {}}]	28	1
179	2020-09-14 09:47:27.55228+03	2	/tutorial/ -- Doomarket - Как заказать?	2	[]	28	1
180	2020-09-14 09:49:53.361056+03	2	/tutorial/ -- Doomarket - Как заказать?	2	[{"changed": {"fields": ["Content"]}}]	28	1
181	2020-09-14 10:13:55.245577+03	2	/tutorial/ -- Doomarket - Как заказать?	2	[{"changed": {"fields": ["Content"]}}]	28	1
182	2020-09-14 10:18:37.585703+03	2	/tutorial/ -- Doomarket - Как заказать?	2	[{"changed": {"fields": ["Content"]}}]	28	1
183	2020-09-14 10:19:26.74485+03	2	/tutorial/ -- Doomarket - Как заказать?	2	[{"changed": {"fields": ["Content"]}}]	28	1
184	2020-09-14 10:21:54.652326+03	2	/tutorial/ -- Doomarket - Как заказать?	2	[{"changed": {"fields": ["Content"]}}]	28	1
185	2020-09-14 10:22:57.378156+03	2	/tutorial/ -- Doomarket - Как заказать?	2	[{"changed": {"fields": ["Content"]}}]	28	1
186	2020-09-14 10:31:17.416183+03	3	/faq/ -- Doomarket - F.A.Q	1	[{"added": {}}]	28	1
187	2020-09-14 11:11:30.245872+03	4	/article-game-pc/ -- Cтатья: Как собрать игровой ПК	1	[{"added": {}}]	28	1
188	2020-09-14 11:15:56.739722+03	4	/article-game-pc/ -- Cтатья: Как собрать игровой ПК	2	[{"changed": {"fields": ["Content"]}}]	28	1
189	2020-09-14 11:17:05.933635+03	4	/article-game-pc/ -- Cтатья: Как собрать игровой ПК	2	[]	28	1
190	2020-09-14 11:19:16.661362+03	4	/article-game-pc/ -- Cтатья: Как собрать игровой ПК	2	[{"changed": {"fields": ["Content"]}}]	28	1
191	2020-09-14 11:19:56.004834+03	4	/article-game-pc/ -- Cтатья: Как собрать игровой ПК	2	[{"changed": {"fields": ["Content"]}}]	28	1
192	2020-09-14 11:20:47.926668+03	4	/article-game-pc/ -- Cтатья: Как собрать игровой ПК	2	[{"changed": {"fields": ["Content"]}}]	28	1
193	2020-09-14 11:24:29.358715+03	5	/smartphones-cheap-price/ -- Статья: Выгодно ли покупать дешевые смартфоны?	1	[{"added": {}}]	28	1
194	2020-09-14 11:57:45.649505+03	6	/about/ -- О нас	1	[{"added": {}}]	28	1
195	2020-09-14 12:05:03.861207+03	7	/contacts/ -- Doomarket - Контактная информация	1	[{"added": {}}]	28	1
196	2020-09-14 12:07:17.191493+03	7	/contacts/ -- Doomarket - Контактная информация	2	[{"changed": {"fields": ["Content"]}}]	28	1
197	2020-09-14 12:09:02.859847+03	7	/contacts/ -- Doomarket - Контактная информация	2	[{"changed": {"fields": ["Content"]}}]	28	1
198	2020-09-14 12:16:36.885021+03	8	/information-for-partners/ -- Doomarket - Партнерам	1	[{"added": {}}]	28	1
199	2020-09-14 12:19:13.824773+03	6	/about/ -- Doomarket - О нас	2	[{"changed": {"fields": ["Title"]}}]	28	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	shop	basis
8	shop	brand
9	shop	category
10	shop	collection
11	shop	product
12	shop	productimg
13	shop	property
14	shop	subcategory
15	eav	attribute
16	eav	enumgroup
17	eav	enumvalue
18	eav	value
20	shop	producttype
21	shop	propertytype
19	shop	value
22	sites	site
23	account	emailaddress
24	account	emailconfirmation
25	orders	orderitem
26	orders	order
27	coupons	coupon
28	flatpages	flatpage
\.


--
-- Data for Name: django_flatpage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_flatpage (id, url, title, content, enable_comments, template_name, registration_required) FROM stdin;
2	/tutorial/	Doomarket - Как заказать?	<p class="tutorial__description">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus? </p>\r\n\r\n\r\n<p class="tutorial__description">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus? </p>\r\n\r\n\r\n<p class="tutorial__description">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus? </p>	f	pages/tutorial.html	f
3	/faq/	Doomarket - F.A.Q	<p class="tutorial__description">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus? </p>\r\n\r\n\r\n<p class="tutorial__description">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus? </p>\r\n\r\n\r\n<p class="tutorial__description">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus? </p>	f	pages/faq.html	f
4	/article-game-pc/	Cтатья: Как собрать игровой ПК	<p class="tutorial__description">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus? </p>\r\n\r\n\r\n\r\n\r\n<p class="tutorial__description">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus? </p>\r\n\r\n\r\n<p class="tutorial__description">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus? </p>	f	pages/article-game-pc.html	f
5	/smartphones-cheap-price/	Статья: Выгодно ли покупать дешевые смартфоны?	<p class="tutorial__description">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus? </p>\r\n\r\n\r\n\r\n\r\n<p class="tutorial__description">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus? </p>\r\n\r\n\r\n<p class="tutorial__description">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus? </p>	f	pages/smartphones-cheap-price.html	f
6	/about/	Doomarket - О нас	<p class="tutorial__description">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus? </p>\r\n\r\n\r\n<p class="tutorial__description">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus? </p>\r\n\r\n\r\n<p class="tutorial__description">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus? </p>	f	pages/about.html	f
7	/contacts/	Doomarket - Контактная информация	<ul  class="tutorial__description">\r\n<li> Почта: grabsomebuds27@gmail.com </li>\r\n<li> Почта: w1ldboyzz@yandex.ru </li>\r\n<li> Номер телефона: +7(900) 652-09-04 </li>\r\n<li> Адрес: г. Санкт-Петербург</li>\r\n</ul> <br>\r\n\r\n<p class="tutorial__description">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus? </p>	f	pages/contacts.html	f
8	/information-for-partners/	Doomarket - Партнерам	<ul  class="tutorial__description">\r\n<li> Почта: grabsomebuds27@gmail.com </li>\r\n<li> Почта: w1ldboyzz@yandex.ru </li>\r\n<li> Номер телефона: +7(900) 652-09-04 </li>\r\n<li> Адрес: г. Санкт-Петербург</li>\r\n<li> Номер карты Тинькоф: 4568464 846846545118</li>\r\n<li> Номер карты Сбербанк: 4568464 846846545118</li>\r\n<li> Номер карты ВТБ: 4568464 846846545118</li>\r\n<li> Номер карты Райфайзен: 4568464 846846545118</li>\r\n<li> БИК: 4568464 846846545118</li>\r\n<li> ИНН: 4568464 846846545118</li>\r\n</ul> <br>\r\n\r\n<p class="tutorial__description">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus?\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quae harum asperiores, animi provident sunt veritatis consequuntur voluptas pariatur obcaecati cumque, error dignissimos eum nulla, saepe suscipit temporibus inventore, voluptate?\r\nPlaceat nobis asperiores et laboriosam dolorem eveniet laborum recusandae, magnam quisquam dolore? Porro, illum, beatae? Incidunt sint, ad, ratione deserunt tempora corrupti, dolores modi ipsam aliquid aliquam doloribus excepturi, aperiam.\r\nAliquam cupiditate amet aperiam corporis, ab obcaecati labore nostrum iure perferendis modi repellat, adipisci est distinctio nam magni odit perspiciatis, cum veritatis, vel dolor? Cum at fugiat ad dolores minus.\r\nAdipisci vel deleniti vero rerum assumenda autem eius facilis totam, neque et ipsam suscipit, laboriosam accusamus ipsa cumque eligendi, perferendis magnam laborum. Asperiores, nesciunt, recusandae atque animi quae aspernatur voluptatem?\r\nReprehenderit quos doloremque, laudantium ea voluptatibus quisquam perferendis ipsum iste, voluptatem similique harum, excepturi, error voluptates aut expedita ducimus. Praesentium voluptate magnam tempora quisquam veniam totam esse aperiam labore voluptatibus? </p>	f	pages/information-for-partners.html	f
\.


--
-- Data for Name: django_flatpage_sites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_flatpage_sites (id, flatpage_id, site_id) FROM stdin;
2	2	1
3	3	1
4	4	1
5	5	1
6	6	1
7	7	1
8	8	1
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-07-14 13:45:38.008083+03
2	auth	0001_initial	2020-07-14 13:45:38.367546+03
3	admin	0001_initial	2020-07-14 13:45:38.982491+03
4	admin	0002_logentry_remove_auto_add	2020-07-14 13:45:39.051311+03
5	admin	0003_logentry_add_action_flag_choices	2020-07-14 13:45:39.077234+03
6	contenttypes	0002_remove_content_type_name	2020-07-14 13:45:39.145173+03
7	auth	0002_alter_permission_name_max_length	2020-07-14 13:45:39.158142+03
8	auth	0003_alter_user_email_max_length	2020-07-14 13:45:39.190084+03
9	auth	0004_alter_user_username_opts	2020-07-14 13:45:39.206012+03
10	auth	0005_alter_user_last_login_null	2020-07-14 13:45:39.223962+03
11	auth	0006_require_contenttypes_0002	2020-07-14 13:45:39.228948+03
12	auth	0007_alter_validators_add_error_messages	2020-07-14 13:45:39.245904+03
13	auth	0008_alter_user_username_max_length	2020-07-14 13:45:39.326934+03
14	auth	0009_alter_user_last_name_max_length	2020-07-14 13:45:39.364859+03
15	auth	0010_alter_group_name_max_length	2020-07-14 13:45:39.380787+03
16	auth	0011_update_proxy_permissions	2020-07-14 13:45:39.39478+03
17	sessions	0001_initial	2020-07-14 13:45:39.451859+03
18	shop	0001_initial	2020-07-14 13:45:40.439116+03
19	eav	0001_initial	2020-07-15 15:24:45.837654+03
20	shop	0002_auto_20200715_1524	2020-07-15 15:24:47.253137+03
21	shop	0002_auto_20200721_2324	2020-07-21 23:24:43.032146+03
22	shop	0003_auto_20200722_1848	2020-07-22 18:49:29.618246+03
23	shop	0004_auto_20200722_2043	2020-07-22 20:43:35.547319+03
24	shop	0005_auto_20200722_2049	2020-07-22 20:49:56.687422+03
25	shop	0006_auto_20200722_2052	2020-07-22 20:52:51.317807+03
26	shop	0007_auto_20200722_2101	2020-07-22 21:01:28.309852+03
27	shop	0008_auto_20200807_1655	2020-08-07 16:56:17.259773+03
28	account	0001_initial	2020-08-10 16:45:42.104889+03
29	account	0002_email_max_length	2020-08-10 16:45:42.530815+03
30	sites	0001_initial	2020-08-10 16:45:42.612279+03
31	sites	0002_alter_domain_unique	2020-08-10 16:45:42.700796+03
32	orders	0001_initial	2020-08-27 17:26:38.69926+03
33	orders	0002_auto_20200902_1846	2020-09-02 18:46:25.000681+03
34	orders	0002_auto_20200909_2015	2020-09-09 20:16:12.726704+03
35	orders	0002_auto_20200910_1644	2020-09-10 16:44:37.927762+03
36	coupons	0001_initial	2020-09-10 17:25:23.374971+03
37	coupons	0002_auto_20200911_1446	2020-09-11 14:47:20.408426+03
38	orders	0003_auto_20200911_1446	2020-09-11 14:47:21.118505+03
39	flatpages	0001_initial	2020-09-13 19:04:24.511364+03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
r302nv3uglf25vdgq32mf5tykebv1vv3	OTc1OWFjNWRmYjRhNDQ2ZTY2ZGM0YWU5ZWY2Y2I5OGY4OGJmMTcyMjp7ImNhcnQiOnt9fQ==	2020-09-30 18:31:20.392646+03
9gphkcwmozaub2q6lar8dhv3973yw7q5	MTBkMGZiNTA0YmNlMGFmNWRlNWQzMDk2YmJlZGY3NjU2MmU2Njc2NTp7ImNhcnQiOnsiNyI6eyJxdWFudGl0eSI6MSwicHJpY2UiOiIzNTk5MC4wMCJ9fSwiZmF2b3JpdGVzIjp7fX0=	2020-09-23 21:17:48.504769+03
0396m1shk16br90qosm8xbklz0b0i4t5	MGMyYzFkYWZmMDkxZWEyZjc2YTEwMjA5OGM5N2MyNjY2NjA3NjgzNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYTFjY2Q0NzYzNWMzZjY5NzhkMTQ2OGI3MjhiYTA0OWMzMzBlYjk5IiwiZmF2b3JpdGVzIjp7IjciOnsicXVhbnRpdHkiOlsicXVhbnRpdHkiLCJxdWFudGl0eSIsInF1YW50aXR5Il0sInByaWNlIjoiMzU5OTAuMDAifSwiNiI6eyJxdWFudGl0eSI6MX0sIjUiOnsicXVhbnRpdHkiOjAsInByaWNlIjoiNTAwMDAuMDAifSwiMyI6eyJxdWFudGl0eSI6MCwicHJpY2UiOiI4OTAwMC4wMCJ9LCIxIjp7InF1YW50aXR5IjoxLCJwcmljZSI6IjU5OTkwLjAwIn0sIjQiOnsicXVhbnRpdHkiOjAsInByaWNlIjoiMTMxOTkwLjAwIn0sIjIiOnsicXVhbnRpdHkiOjEsInByaWNlIjoiMzM5OTAuMDAifX0sIl9sYW5ndWFnZSI6InJ1IiwiY2FydCI6eyI2Ijp7InF1YW50aXR5Ijo2LCJwcmljZSI6IjEwODAwMC4wMCJ9fX0=	2020-09-18 18:44:16.001242+03
ht2qf1yli0s1gp85itmjosm20o7q1ct2	NmJhNmY1MjhkNDk2NWU3ODJlMjBhZTdjMjEwYWM4OTU0ODBlYzFkODp7ImNhcnQiOnt9LCJmYXZvcml0ZXMiOnt9fQ==	2020-09-19 16:21:42.261643+03
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: eav_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.eav_attribute (id, name, slug, description, datatype, created, modified, required, display_order, enum_group_id) FROM stdin;
1	Ширина	shirina	фцвафааыв	enum	2020-07-15 15:29:34.752834+03	2020-07-15 15:29:34.766797+03	t	1	1
2	Width	width	\N	text	2020-07-15 16:07:33.692097+03	2020-07-15 16:07:33.785592+03	f	1	\N
3	Высота	vysota	фвцй	int	2020-07-15 16:38:17.2379+03	2020-07-15 16:38:17.247874+03	t	1	\N
4	кнопка посередине	knopka-poseredine	хи	enum	2020-07-15 17:38:20.851665+03	2020-07-15 17:38:20.867622+03	t	2	1
\.


--
-- Data for Name: eav_enumgroup; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.eav_enumgroup (id, name) FROM stdin;
1	размер
2	Кнопка
3	Кнопка посередине
\.


--
-- Data for Name: eav_enumgroup_values; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.eav_enumgroup_values (id, enumgroup_id, enumvalue_id) FROM stdin;
1	1	1
2	2	2
3	3	2
4	3	3
\.


--
-- Data for Name: eav_enumvalue; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.eav_enumvalue (id, value) FROM stdin;
1	21
2	Да
3	Нет
\.


--
-- Data for Name: eav_value; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.eav_value (id, entity_id, value_text, value_float, value_int, value_date, value_bool, generic_value_id, created, modified, attribute_id, entity_ct_id, generic_value_ct_id, value_enum_id) FROM stdin;
2	1		\N	20	\N	\N	\N	2020-07-15 16:39:32+03	2020-07-15 17:32:07.292857+03	3	11	\N	\N
3	1		\N	\N	\N	\N	0	2020-07-15 17:38:41+03	2020-07-15 17:40:18.871471+03	4	11	\N	2
\.


--
-- Data for Name: orders_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders_order (id, first_name, last_name, email, address, postal_code, city, created, updated, paid, coupon_id, discount) FROM stdin;
12	den	matv	dasdasdas@mail.com	sasdasdasd	asdasd	asdasdasd	2020-08-31 20:03:36.239924+03	2020-08-31 20:03:36.239924+03	f	\N	0
13	Денис	Матвиенко	grabsomebuds27@gmail.com	выаыва	26516	1651651	2020-09-01 09:48:38.346116+03	2020-09-01 09:48:38.346116+03	f	\N	0
14	Сергей	Резвых	w1ldboyzz@yandex.ru	спб	03145	спб	2020-09-01 16:04:47.837684+03	2020-09-01 16:04:47.837684+03	f	\N	0
15	Сергей	Резвых	w1ldboyzz@yandex.ru	спб	03145	спб	2020-09-01 16:05:16.644563+03	2020-09-01 16:05:16.644563+03	f	\N	0
16	Сергей	Резвых	w1ldboyzz@yandex.ru	спб	03145	спб	2020-09-01 16:07:25.156292+03	2020-09-01 16:07:25.156292+03	f	\N	0
17	Сергей	Резвых	w1ldboyzz@yandex.ru	спб	03145	спб	2020-09-01 17:33:27.495151+03	2020-09-01 17:33:27.495151+03	f	\N	0
18	Сергей	Резвых	w1ldboyzz@yandex.ru	спб	03145	спб	2020-09-02 14:30:00.357979+03	2020-09-02 14:30:00.357979+03	f	\N	0
19	Сергей	Резвых	w1ldboyzz@yandex.ru	спб	03145	спб	2020-09-02 15:07:17.457926+03	2020-09-02 15:07:17.457926+03	f	\N	0
20	Сергей	Резвых	w1ldboyzz@yandex.ru	спб	03145	спб	2020-09-02 15:14:45.120144+03	2020-09-02 15:14:45.120144+03	f	\N	0
21	Денис	Матвиенко	grabsomebuds27@gmail.com	выаыва	26516	1651651	2020-09-02 15:19:10.240386+03	2020-09-02 15:19:10.240386+03	f	\N	0
22	Сергей	Резвых	w1ldboyzz@yandex.ru	спб	03145	спб	2020-09-03 10:27:36.384444+03	2020-09-03 10:27:36.384444+03	f	\N	0
23	Денис	Матвиенко	grabsomebuds27@gmail.com	выаыва	26516	1651651	2020-09-03 10:33:07.357839+03	2020-09-03 10:33:07.357839+03	f	\N	0
24	Сергей	Резвых	w1ldboyzz@yandex.ru	спб	03145	спб	2020-09-03 19:39:36.578247+03	2020-09-03 19:39:36.578247+03	f	\N	0
25	Денис	Матвиенко	grabsomebuds27@gmail.com	выаыва	26516	1651651	2020-09-04 12:06:00.899004+03	2020-09-04 12:06:00.899004+03	f	\N	0
26	Сергей	Резвых	w1ldboyzz@yandex.ru	спб	03145	спб	2020-09-09 11:02:07.124466+03	2020-09-09 11:02:07.124466+03	f	\N	0
27	Сергей	Резвых	w1ldboyzz@yandex.ru	спб	03145	спб	2020-09-09 17:49:10.306896+03	2020-09-09 17:49:10.306896+03	f	\N	0
28	Денис	Матвиенко	grabsomebuds27@gmail.com	выаыва	26516	1651651	2020-09-09 19:07:37.333279+03	2020-09-09 19:07:37.333279+03	f	\N	0
29	Сергей	Резвых	w1ldboyzz@yandex.ru	спб	03145	спб	2020-09-09 20:11:40.93669+03	2020-09-09 20:11:40.937689+03	f	\N	0
30	Сергей	Резвых	w1ldboyzz@yandex.ru	спб	03145	спб	2020-09-10 12:56:21.393345+03	2020-09-10 12:56:21.393345+03	f	\N	0
31	Денис	Матвиенко	grabsomebuds27@gmail.com	выаыва	26516	1651651	2020-09-10 13:01:40.327231+03	2020-09-10 13:01:40.327231+03	f	\N	0
32	Сергей	Резвых	w1ldboyzz@yandex.ru	спб	03145	спб	2020-09-11 14:03:14.166781+03	2020-09-11 14:03:14.166781+03	f	\N	0
33	Сергей	Резвых	w1ldboyzz@yandex.ru	спб	03145	спб	2020-09-11 14:30:18.138598+03	2020-09-11 14:30:18.138598+03	f	\N	0
34	andrey	Матвиенко	grabsomebuds27@gmail.com	выаыва	26516	1651651	2020-09-11 15:04:15.258925+03	2020-09-11 15:04:15.258925+03	f	1	10
35	andrey	Матвиенко	grabsomebuds27@gmail.com	выаыва	26516	1651651	2020-09-11 15:34:48.502467+03	2020-09-11 15:34:48.502467+03	f	1	10
36	Сергей	Резвых	w1ldboyzz@yandex.ru	спб	03145	спб	2020-09-12 17:26:51.066958+03	2020-09-12 17:26:51.066958+03	f	\N	0
37	andrey	Матвиенко	grabsomebuds27@gmail.com	выаыва	26516	1651651	2020-09-12 17:27:08.445819+03	2020-09-12 17:27:08.445819+03	f	\N	0
38	Сергей	Резвых	w1ldboyzz@yandex.ru	спб	03145	спб	2020-09-12 20:48:48.336933+03	2020-09-12 20:48:48.336933+03	f	\N	0
39	Денис	Матвиенко	grabsomebuds27@gmail.com	выаыва	26516	1651651	2020-09-12 20:50:37.667259+03	2020-09-12 20:50:37.668256+03	f	\N	0
40	andrey	Матвиенко	grabsomebuds27@gmail.com	выаыва	26516	1651651	2020-09-12 20:50:59.849652+03	2020-09-12 20:50:59.849652+03	f	\N	0
41	Сергей	Резвых	w1ldboyzz@yandex.ru	спб	03145	спб	2020-09-12 20:52:05.965296+03	2020-09-12 20:52:05.965296+03	f	\N	0
42	Денис	Матвиенко	grabsomebuds27@gmail.com	выаыва	26516	1651651	2020-09-12 20:52:28.530342+03	2020-09-12 20:52:28.530342+03	f	\N	0
43	andrey	Матвиенко	grabsomebuds27@gmail.com	выаыва	26516	1651651	2020-09-12 20:52:44.977631+03	2020-09-12 20:52:44.977631+03	f	\N	0
44	Сергей	Резвых	w1ldboyzz@yandex.ru	спб	03145	спб	2020-09-12 20:58:06.773485+03	2020-09-12 20:58:06.773485+03	f	\N	0
45	andrey	Матвиенко	grabsomebuds27@gmail.com	выаыва	26516	1651651	2020-09-12 20:58:32.809693+03	2020-09-12 20:58:32.809693+03	f	\N	0
46	Сергей	Резвых	w1ldboyzz@yandex.ru	спб	03145	спб	2020-09-12 21:03:01.811523+03	2020-09-12 21:03:01.811523+03	f	\N	0
47	andrey	Матвиенко	grabsomebuds27@gmail.com	выаыва	26516	1651651	2020-09-12 21:26:06.086478+03	2020-09-12 21:26:06.086478+03	f	\N	0
48	Сергей	Резвых	w1ldboyzz@yandex.ru	спб	03145	спб	2020-09-12 23:06:53.743021+03	2020-09-12 23:06:53.743021+03	f	\N	0
49	andrey	Матвиенко	grabsomebuds27@gmail.com	выаыва	26516	1651651	2020-09-12 23:07:09.052686+03	2020-09-12 23:07:09.052686+03	f	\N	0
50	andrey	Матвиенко	grabsomebuds27@gmail.com	выаыва	26516	1651651	2020-09-12 23:07:59.088603+03	2020-09-12 23:07:59.088603+03	f	\N	0
51	andrey	Матвиенко	grabsomebuds27@gmail.com	выаыва	26516	1651651	2020-09-12 23:10:50.540598+03	2020-09-12 23:10:50.540598+03	f	\N	0
52	Сергей	Резвых	w1ldboyzz@yandex.ru	спб	03145	спб	2020-09-13 12:39:59.716805+03	2020-09-13 12:39:59.716805+03	f	\N	0
53	Денис	Матвиенко	grabsomebuds27@gmail.com	выаыва	26516	1651651	2020-09-13 12:40:30.306526+03	2020-09-13 12:40:30.306526+03	f	1	10
54	Сергей	Резвых	w1ldboyzz@yandex.ru	спб	03145	спб	2020-09-13 13:25:28.290276+03	2020-09-13 13:25:28.290276+03	f	1	10
55	andrey	Матвиенко	grabsomebuds27@gmail.com	выаыва	26516	1651651	2020-09-13 15:49:47.453706+03	2020-09-13 15:49:47.453706+03	f	1	10
56	Сергей	Резвых	w1ldboyzz@yandex.ru	спб	03145	спб	2020-09-13 15:50:23.806055+03	2020-09-13 15:50:23.806055+03	f	1	10
57	andrey	Матвиенко	grabsomebuds27@gmail.com	выаыва	26516	1651651	2020-09-13 15:56:14.007388+03	2020-09-13 15:56:14.007388+03	f	\N	0
58	Сергей	Резвых	w1ldboyzz@yandex.ru	спб	03145	спб	2020-09-13 15:56:33.299959+03	2020-09-13 15:56:33.299959+03	f	\N	0
59	Сергей	Резвых	w1ldboyzz@yandex.ru	спб	03145	спб	2020-09-13 16:08:18.673967+03	2020-09-13 16:08:18.673967+03	f	\N	0
60	Денис	Матвиенко	grabsomebuds27@gmail.com	выаыва	26516	1651651	2020-09-13 16:08:30.765019+03	2020-09-13 16:08:30.765019+03	f	\N	0
61	Сергей	Резвых	w1ldboyzz@yandex.ru	спб	03145	спб	2020-09-14 12:24:08.788089+03	2020-09-14 12:24:08.788089+03	f	\N	0
\.


--
-- Data for Name: orders_orderitem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders_orderitem (id, price, quantity, order_id, product_id) FROM stdin;
11	50000.00	1	12	5
12	89000.00	1	13	3
13	131990.00	1	14	4
14	108000.00	1	14	6
15	131990.00	1	15	4
16	108000.00	1	15	6
17	131990.00	1	16	4
18	108000.00	1	16	6
19	131990.00	1	17	4
20	108000.00	1	17	6
21	131990.00	1	18	4
22	108000.00	1	18	6
23	131990.00	1	19	4
24	108000.00	1	19	6
25	35990.00	1	20	7
26	89000.00	1	20	3
27	35990.00	1	21	7
28	89000.00	3	22	3
29	131990.00	1	23	4
30	89000.00	1	24	3
31	33990.00	5	24	2
32	35990.00	2	25	7
33	89000.00	1	26	3
34	35990.00	1	27	7
35	108000.00	1	27	6
36	35990.00	1	28	7
37	89000.00	1	28	3
38	89000.00	1	29	3
39	35990.00	1	29	7
40	89000.00	1	30	3
41	35990.00	5	31	7
42	89000.00	1	32	3
43	131990.00	1	32	4
44	89000.00	1	33	3
45	131990.00	1	33	4
46	50000.00	1	33	5
47	33990.00	1	34	2
48	131990.00	1	34	4
49	59990.00	1	35	1
50	50000.00	1	35	5
51	131990.00	1	36	4
52	33990.00	1	36	2
53	89000.00	1	37	3
54	59990.00	1	37	1
55	89000.00	1	38	3
56	33990.00	1	38	2
57	131990.00	1	39	4
58	35990.00	1	39	7
59	89000.00	1	39	3
60	131990.00	1	40	4
61	89000.00	1	40	3
62	89000.00	1	41	3
63	108000.00	1	41	6
64	89000.00	1	42	3
65	108000.00	1	42	6
66	89000.00	1	43	3
67	108000.00	1	43	6
68	89000.00	1	44	3
69	108000.00	1	44	6
70	89000.00	1	45	3
71	33990.00	1	45	2
72	89000.00	1	46	3
73	108000.00	1	46	6
74	89000.00	1	47	3
75	33990.00	1	47	2
76	89000.00	1	48	3
77	33990.00	1	48	2
78	59990.00	1	48	1
79	50000.00	1	49	5
80	35990.00	1	49	7
81	89000.00	1	50	3
82	131990.00	1	50	4
83	89000.00	1	51	3
84	33990.00	1	51	2
85	89000.00	1	52	3
86	33990.00	1	52	2
87	89000.00	1	53	3
88	131990.00	1	53	4
89	89000.00	1	54	3
90	35990.00	1	54	7
91	89000.00	1	55	3
92	131990.00	1	55	4
93	89000.00	1	56	3
94	131990.00	1	56	4
95	89000.00	1	57	3
96	35990.00	1	57	7
97	131990.00	1	57	4
98	89000.00	1	58	3
99	33990.00	1	58	2
100	108000.00	1	58	6
101	89000.00	1	59	3
102	131990.00	1	59	4
103	89000.00	1	60	3
104	33990.00	1	60	2
105	108000.00	7	61	6
\.


--
-- Data for Name: shop_brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop_brand (id, name, alias, slug, icon_field) FROM stdin;
1	Apple	Apple	apple	
2	Samsung	Samsung	samsung	
\.


--
-- Data for Name: shop_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop_category (id, name, alias, slug, icon_field, alias_en, alias_ru, name_en, name_ru) FROM stdin;
2	Бытовая техника	Бытовая техника	bytovaja-tehnika	category_icon/fridge_kh62INO.png	Appliance	Бытовая техника	Appliances	Бытовая техника
1	Электроника	Электроника	elektronika	category_icon/phone_0G7iqyk.png	Electronics products	Электроника	Electronics products	Электроника
\.


--
-- Data for Name: shop_collection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop_collection (id, name, alias, slug) FROM stdin;
1	Iphone	Iphone	iphone
2	Watch	Watch	watch
3	S	S10	s
4	MacBook	MacBook	macbook
5	A	A	a
\.


--
-- Data for Name: shop_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop_product (id, name, article, slug, description, price, available, created, updated, title_img, brand_id, categories_id, collection_id, subcategories_id, product_type_id, description_en, description_ru, name_en, name_ru) FROM stdin;
1	Apple iPhone 11, 64 ГБ, черный	adafsdc213as	apple-iphone-11-64-gb-chernyj1594725723	Ничего лишнего.\r\nТолько самое.Новая система двух камер. Аккумулятор на целый день без подзарядки.1 Самое прочное стекло и самый быстрый процессор iPhone.	59990.00	t	2020-07-14 14:22:03.552411+03	2020-07-14 14:22:03.552411+03	products/MWYK2.jpg	1	1	1	1	1	\N	Ничего лишнего.\r\nТолько самое.Новая система двух камер. Аккумулятор на целый день без подзарядки.1 Самое прочное стекло и самый быстрый процессор iPhone.	\N	Apple iPhone 11, 64 ГБ, черный
3	Samsung Galaxy S10+ 128 ГБ	adwasdas	samsung-galaxy-s10-128-gb1594740523	AFSFVVXCVsfsdsdvsdvsdsd	89000.00	t	2020-07-14 18:28:43.657515+03	2020-07-14 18:28:43.657515+03	products/galaxy_s20_eXqdvwD.jpg	2	1	3	1	1	\N	AFSFVVXCVsfsdsdvsdvsdsd	\N	Samsung Galaxy S10+ 128 ГБ
2	Apple Watch Series 5, 44 мм	zdflrpf930u49	apple-watch-series-5-44-mm1594726076	Эти часы не спускают глаз\r\nс вашего сердца.\r\nОни позволяют быстро проверять сердечный ритм. А ещё можно настроить уведомления о слишком низком и высоком пульсе.	33990.00	t	2020-07-14 14:27:56.190918+03	2020-07-14 14:27:56.190918+03	products/MWV72RUA_1.jpg	1	1	2	1	2	\N	Эти часы не спускают глаз\r\nс вашего сердца.\r\nОни позволяют быстро проверять сердечный ритм. А ещё можно настроить уведомления о слишком низком и высоком пульсе.	\N	Apple Watch Series 5, 44 мм
5	SAMSUNG Galaxy A20	FWCDSDSSAssa	samsung-galaxy-a201596543019	samsung	50000.00	t	2020-08-04 15:10:19.932221+03	2020-08-04 15:10:19.932221+03	products/galaxys10_fFCVK1D.jpg	2	1	5	1	1	\N	samsung	\N	SAMSUNG Galaxy A20
6	Samsung Galaxy S20 Ultra 128 Гб	awdaf21edq	samsung-galaxy-s20-ultra-128-gb1596543265	awdaddddddddddddddddddddddddddddddddddd	108000.00	t	2020-08-04 15:14:25.820953+03	2020-08-04 15:14:25.820953+03	products/20.jpg	2	1	3	1	1	\N	awdaddddddddddddddddddddddddddddddddddd	\N	Samsung Galaxy S20 Ultra 128 Гб
4	Apple MacBook Pro 13	MV992RU/A	apple-macbook-pro-131596098503	Touch Bar и Touch ID.\r\nИнтерфейс Touch Bar автоматически выводит на клавиатуру необходимые инструменты и меняется в зависимости от приложения, которым вы пользуетесь. Таким образом, нужные вам инструменты всегда под рукой.	131990.00	t	2020-07-30 11:41:43.803556+03	2020-07-30 11:41:43.803556+03	products/df05179e0529034ea0bc62441989ac6b_kjiH0QS.jpg	1	1	4	2	3	\N	Touch Bar и Touch ID.\r\nИнтерфейс Touch Bar автоматически выводит на клавиатуру необходимые инструменты и меняется в зависимости от приложения, которым вы пользуетесь. Таким образом, нужные вам инструменты всегда под рукой.	\N	Apple MacBook Pro 13
7	Apple iPhone 8	MQ6G2RU/A	apple-iphone-81596552863	Для iPhone 8 мы разработали совершенно новый дизайн, в котором передняя и задняя\r\nпанели выполнены из стекла. Самая популярная камера усовершенствована.\r\nУстановлен самый умный и мощный процессор, когда-либо созданный для iPhone.\r\nБез проводов процесс зарядки становится элементарным. А дополненная реальность\r\nоткрывает невиданные до сих пор возможности. iPhone 8. Новое поколение iPhone.	35990.00	t	2020-08-04 17:54:23.929018+03	2020-08-04 17:54:23.929018+03	products/iphone8.jpg	1	1	1	1	1	Hello world, this descr in english	Для iPhone 8 мы разработали совершенно новый дизайн, в котором передняя и задняя\r\nпанели выполнены из стекла. Самая популярная камера усовершенствована.\r\nУстановлен самый умный и мощный процессор, когда-либо созданный для iPhone.\r\nБез проводов процесс зарядки становится элементарным. А дополненная реальность\r\nоткрывает невиданные до сих пор возможности. iPhone 8. Новое поколение iPhone.	\N	Apple iPhone 8
\.


--
-- Data for Name: shop_productimg; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop_productimg (id, name, image, product_id) FROM stdin;
1	Apple Watch Series 5, 44 мм	product_img/MWV72RUA_0.jpg	2
2	Samsung	product_img/3f60f86857da26a73acb2ad8eb5e24d4_NtyJRBb.jpg	3
3	Samsung	product_img/galaxy10_By3osTK.jpg	3
4	Apple	product_img/d3af676bae25805a0ff928cd95afca11_QATwI8V.jpg	4
5	мак	product_img/b74806df2b01da6cbcc1c0614f7e278a_UIU6J2C.jpg	4
6	s10	product_img/20.jpg	3
7	s10	product_img/s20.jpg	3
8	s10	product_img/galaxy10_8ytyawj.jpg	3
9	s10	product_img/galaxys10.jpg	3
\.


--
-- Data for Name: shop_producttype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop_producttype (id, name, alias, slug, icon_field, subcategories_id, alias_en, alias_ru, name_en, name_ru) FROM stdin;
3	Ноутбуки	Ноутбук	noutbuki	basis_icon/computer.png	2	Laptop	Ноутбук	Laptops	Ноутбуки
2	Смарт-часы	Смарт-часы	smart-chasy	basis_icon/watch-icon_AVaMXv4.png	1	Smart-watch	Смарт-часы	Smart-watches	Смарт-часы
1	Смартфоны	Смартфон	smartfony	basis_icon/phone_oUe9YKC.png	1	Smartphone	Смартфон	Smartphones	Смартфоны
\.


--
-- Data for Name: shop_property; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop_property (id, name, alias, slug, alias_en, alias_ru, name_en, name_ru) FROM stdin;
1	Ширина	Ширина	shirina1595363774	Width	Ширина	Width	Ширина
2	Глубина	Глубина	glubina1595431340	Depth	Глубина	Depth	Глубина
3	Длина	Длина	dlina1595431354	Length	Длина	Length	Длина
4	Высота	Высота	vysota1595431364	Height	Высота	Height	Высота
5	Толщина	Толщина	tolschina1595433896	Thickness	Толщина	Thickness	Толщина
6	Диагональ экрана	Диагональ экрана	diagonal-ekrana1596099004	Diagonal	Диагональ экрана	Diagonal	Диагональ экрана
7	Длина браслета	Длина браслета	dlina-brasleta1596485036	Length of bracelet	Длина браслета	Length of bracelet	Длина браслета
\.


--
-- Data for Name: shop_property_product_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop_property_product_type (id, property_id, producttype_id) FROM stdin;
2	2	1
3	3	1
4	4	1
7	1	1
9	5	2
11	6	3
12	7	2
\.


--
-- Data for Name: shop_subcategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop_subcategory (id, name, alias, slug, icon_field, categories_id, alias_en, alias_ru, name_en, name_ru) FROM stdin;
2	Ноутбуки, планшеты, электронные книги	Ноутбуки, планшеты, электронные книги	noutbuki-planshety-elektronnye-knigi	subcategory_icon/computer.png	1	Laptops, tablets, electronic books	Ноутбуки, планшеты, электронные книги	Laptops, tablets, electronic books	Ноутбуки, планшеты, электронные книги
1	Телефоны и смарт-часы	Телефоны и смарт-часы	telefony-i-smart-chasy	subcategory_icon/phone.png	1	Phones & smart-watches	Телефоны и смарт-часы	Phones & smart-watches	Телефоны и смарт-часы
\.


--
-- Data for Name: shop_value; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop_value (id, value, product_id, properties_id, value_en, value_ru) FROM stdin;
4	36	1	1	\N	36
3	50	3	2	\N	50
2	31	3	1	\N	31
1	21	1	4	\N	21
8	208	1	2	\N	208
9	105	3	4	\N	105
6	100	2	5	\N	100
10	13.3"	4	6	\N	13.3"
11	150 см	2	7	\N	150 см
12	15	5	1	\N	15
13	25	5	4	\N	25
14	13	5	2	\N	13
15	55	6	1	\N	55
16	20	6	2	\N	20
17	14	6	4	\N	14
18	10	7	1	\N	10
19	11	7	2	\N	11
20	12	7	4	\N	12
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 1, false);


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 116, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 15, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: coupons_coupon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupons_coupon_id_seq', 1, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 199, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 28, true);


--
-- Name: django_flatpage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_flatpage_id_seq', 8, true);


--
-- Name: django_flatpage_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_flatpage_sites_id_seq', 8, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 39, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: eav_attribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.eav_attribute_id_seq', 4, true);


--
-- Name: eav_enumgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.eav_enumgroup_id_seq', 3, true);


--
-- Name: eav_enumgroup_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.eav_enumgroup_values_id_seq', 4, true);


--
-- Name: eav_enumvalue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.eav_enumvalue_id_seq', 3, true);


--
-- Name: eav_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.eav_value_id_seq', 3, true);


--
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 61, true);


--
-- Name: orders_orderitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_orderitem_id_seq', 105, true);


--
-- Name: shop_brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shop_brand_id_seq', 2, true);


--
-- Name: shop_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shop_category_id_seq', 2, true);


--
-- Name: shop_collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shop_collection_id_seq', 5, true);


--
-- Name: shop_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shop_product_id_seq', 7, true);


--
-- Name: shop_productimg_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shop_productimg_id_seq', 9, true);


--
-- Name: shop_productinstancepropertyvalue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shop_productinstancepropertyvalue_id_seq', 20, true);


--
-- Name: shop_producttype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shop_producttype_id_seq', 3, true);


--
-- Name: shop_propertytype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shop_propertytype_id_seq', 7, true);


--
-- Name: shop_propertytype_product_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shop_propertytype_product_type_id_seq', 12, true);


--
-- Name: shop_subcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shop_subcategory_id_seq', 2, true);


--
-- Name: account_emailaddress account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: coupons_coupon coupons_coupon_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupons_coupon
    ADD CONSTRAINT coupons_coupon_code_key UNIQUE (code);


--
-- Name: coupons_coupon coupons_coupon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupons_coupon
    ADD CONSTRAINT coupons_coupon_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_flatpage django_flatpage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_flatpage
    ADD CONSTRAINT django_flatpage_pkey PRIMARY KEY (id);


--
-- Name: django_flatpage_sites django_flatpage_sites_flatpage_id_site_id_0d29d9d1_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_flatpage_sites
    ADD CONSTRAINT django_flatpage_sites_flatpage_id_site_id_0d29d9d1_uniq UNIQUE (flatpage_id, site_id);


--
-- Name: django_flatpage_sites django_flatpage_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_flatpage_sites
    ADD CONSTRAINT django_flatpage_sites_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: eav_attribute eav_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eav_attribute
    ADD CONSTRAINT eav_attribute_pkey PRIMARY KEY (id);


--
-- Name: eav_attribute eav_attribute_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eav_attribute
    ADD CONSTRAINT eav_attribute_slug_key UNIQUE (slug);


--
-- Name: eav_enumgroup eav_enumgroup_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eav_enumgroup
    ADD CONSTRAINT eav_enumgroup_name_key UNIQUE (name);


--
-- Name: eav_enumgroup eav_enumgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eav_enumgroup
    ADD CONSTRAINT eav_enumgroup_pkey PRIMARY KEY (id);


--
-- Name: eav_enumgroup_values eav_enumgroup_values_enumgroup_id_enumvalue_id_bec52735_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eav_enumgroup_values
    ADD CONSTRAINT eav_enumgroup_values_enumgroup_id_enumvalue_id_bec52735_uniq UNIQUE (enumgroup_id, enumvalue_id);


--
-- Name: eav_enumgroup_values eav_enumgroup_values_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eav_enumgroup_values
    ADD CONSTRAINT eav_enumgroup_values_pkey PRIMARY KEY (id);


--
-- Name: eav_enumvalue eav_enumvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eav_enumvalue
    ADD CONSTRAINT eav_enumvalue_pkey PRIMARY KEY (id);


--
-- Name: eav_enumvalue eav_enumvalue_value_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eav_enumvalue
    ADD CONSTRAINT eav_enumvalue_value_key UNIQUE (value);


--
-- Name: eav_value eav_value_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eav_value
    ADD CONSTRAINT eav_value_pkey PRIMARY KEY (id);


--
-- Name: orders_order orders_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_order
    ADD CONSTRAINT orders_order_pkey PRIMARY KEY (id);


--
-- Name: orders_orderitem orders_orderitem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_orderitem
    ADD CONSTRAINT orders_orderitem_pkey PRIMARY KEY (id);


--
-- Name: shop_brand shop_brand_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_brand
    ADD CONSTRAINT shop_brand_pkey PRIMARY KEY (id);


--
-- Name: shop_brand shop_brand_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_brand
    ADD CONSTRAINT shop_brand_slug_key UNIQUE (slug);


--
-- Name: shop_category shop_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_category
    ADD CONSTRAINT shop_category_pkey PRIMARY KEY (id);


--
-- Name: shop_category shop_category_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_category
    ADD CONSTRAINT shop_category_slug_key UNIQUE (slug);


--
-- Name: shop_collection shop_collection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_collection
    ADD CONSTRAINT shop_collection_pkey PRIMARY KEY (id);


--
-- Name: shop_collection shop_collection_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_collection
    ADD CONSTRAINT shop_collection_slug_key UNIQUE (slug);


--
-- Name: shop_product shop_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_product
    ADD CONSTRAINT shop_product_pkey PRIMARY KEY (id);


--
-- Name: shop_product shop_product_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_product
    ADD CONSTRAINT shop_product_slug_key UNIQUE (slug);


--
-- Name: shop_productimg shop_productimg_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_productimg
    ADD CONSTRAINT shop_productimg_pkey PRIMARY KEY (id);


--
-- Name: shop_value shop_productinstancepropertyvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_value
    ADD CONSTRAINT shop_productinstancepropertyvalue_pkey PRIMARY KEY (id);


--
-- Name: shop_producttype shop_producttype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_producttype
    ADD CONSTRAINT shop_producttype_pkey PRIMARY KEY (id);


--
-- Name: shop_producttype shop_producttype_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_producttype
    ADD CONSTRAINT shop_producttype_slug_key UNIQUE (slug);


--
-- Name: shop_property shop_property_name_en_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_property
    ADD CONSTRAINT shop_property_name_en_key UNIQUE (name_en);


--
-- Name: shop_property shop_property_name_ru_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_property
    ADD CONSTRAINT shop_property_name_ru_key UNIQUE (name_ru);


--
-- Name: shop_property shop_propertytype_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_property
    ADD CONSTRAINT shop_propertytype_name_key UNIQUE (name);


--
-- Name: shop_property shop_propertytype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_property
    ADD CONSTRAINT shop_propertytype_pkey PRIMARY KEY (id);


--
-- Name: shop_property_product_type shop_propertytype_produc_propertytype_id_productt_01e24c30_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_property_product_type
    ADD CONSTRAINT shop_propertytype_produc_propertytype_id_productt_01e24c30_uniq UNIQUE (property_id, producttype_id);


--
-- Name: shop_property_product_type shop_propertytype_product_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_property_product_type
    ADD CONSTRAINT shop_propertytype_product_type_pkey PRIMARY KEY (id);


--
-- Name: shop_property shop_propertytype_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_property
    ADD CONSTRAINT shop_propertytype_slug_key UNIQUE (slug);


--
-- Name: shop_subcategory shop_subcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_subcategory
    ADD CONSTRAINT shop_subcategory_pkey PRIMARY KEY (id);


--
-- Name: shop_subcategory shop_subcategory_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_subcategory
    ADD CONSTRAINT shop_subcategory_slug_key UNIQUE (slug);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailaddress_user_id_2c513194; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);


--
-- Name: account_emailconfirmation_email_address_id_5b7f8c58; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: coupons_coupon_code_40174643_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX coupons_coupon_code_40174643_like ON public.coupons_coupon USING btree (code varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_flatpage_sites_flatpage_id_078bbc8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_flatpage_sites_flatpage_id_078bbc8b ON public.django_flatpage_sites USING btree (flatpage_id);


--
-- Name: django_flatpage_sites_site_id_bfd8ea84; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_flatpage_sites_site_id_bfd8ea84 ON public.django_flatpage_sites USING btree (site_id);


--
-- Name: django_flatpage_url_41612362; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_flatpage_url_41612362 ON public.django_flatpage USING btree (url);


--
-- Name: django_flatpage_url_41612362_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_flatpage_url_41612362_like ON public.django_flatpage USING btree (url varchar_pattern_ops);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: eav_attribute_enum_group_id_47628614; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX eav_attribute_enum_group_id_47628614 ON public.eav_attribute USING btree (enum_group_id);


--
-- Name: eav_attribute_slug_1c525d06_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX eav_attribute_slug_1c525d06_like ON public.eav_attribute USING btree (slug varchar_pattern_ops);


--
-- Name: eav_enumgroup_name_1077d89b_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX eav_enumgroup_name_1077d89b_like ON public.eav_enumgroup USING btree (name varchar_pattern_ops);


--
-- Name: eav_enumgroup_values_enumgroup_id_2bdd7858; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX eav_enumgroup_values_enumgroup_id_2bdd7858 ON public.eav_enumgroup_values USING btree (enumgroup_id);


--
-- Name: eav_enumgroup_values_enumvalue_id_52f83e3a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX eav_enumgroup_values_enumvalue_id_52f83e3a ON public.eav_enumgroup_values USING btree (enumvalue_id);


--
-- Name: eav_enumvalue_value_027e7652_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX eav_enumvalue_value_027e7652_like ON public.eav_enumvalue USING btree (value varchar_pattern_ops);


--
-- Name: eav_value_attribute_id_6fd472ba; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX eav_value_attribute_id_6fd472ba ON public.eav_value USING btree (attribute_id);


--
-- Name: eav_value_entity_ct_id_5cfd530e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX eav_value_entity_ct_id_5cfd530e ON public.eav_value USING btree (entity_ct_id);


--
-- Name: eav_value_generic_value_ct_id_d4681436; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX eav_value_generic_value_ct_id_d4681436 ON public.eav_value USING btree (generic_value_ct_id);


--
-- Name: eav_value_value_enum_id_86e48f74; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX eav_value_value_enum_id_86e48f74 ON public.eav_value USING btree (value_enum_id);


--
-- Name: orders_order_coupon_id_5bddb887; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_order_coupon_id_5bddb887 ON public.orders_order USING btree (coupon_id);


--
-- Name: orders_orderitem_order_id_fe61a34d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_orderitem_order_id_fe61a34d ON public.orders_orderitem USING btree (order_id);


--
-- Name: orders_orderitem_product_id_afe4254a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_orderitem_product_id_afe4254a ON public.orders_orderitem USING btree (product_id);


--
-- Name: shop_brand_alias_eb97a137; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_brand_alias_eb97a137 ON public.shop_brand USING btree (alias);


--
-- Name: shop_brand_alias_eb97a137_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_brand_alias_eb97a137_like ON public.shop_brand USING btree (alias varchar_pattern_ops);


--
-- Name: shop_brand_slug_5d7ff4c0_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_brand_slug_5d7ff4c0_like ON public.shop_brand USING btree (slug varchar_pattern_ops);


--
-- Name: shop_category_alias_80016880; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_category_alias_80016880 ON public.shop_category USING btree (alias);


--
-- Name: shop_category_alias_80016880_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_category_alias_80016880_like ON public.shop_category USING btree (alias varchar_pattern_ops);


--
-- Name: shop_category_alias_en_75825375; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_category_alias_en_75825375 ON public.shop_category USING btree (alias_en);


--
-- Name: shop_category_alias_en_75825375_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_category_alias_en_75825375_like ON public.shop_category USING btree (alias_en varchar_pattern_ops);


--
-- Name: shop_category_alias_ru_7c2ff241; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_category_alias_ru_7c2ff241 ON public.shop_category USING btree (alias_ru);


--
-- Name: shop_category_alias_ru_7c2ff241_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_category_alias_ru_7c2ff241_like ON public.shop_category USING btree (alias_ru varchar_pattern_ops);


--
-- Name: shop_category_slug_4508178e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_category_slug_4508178e_like ON public.shop_category USING btree (slug varchar_pattern_ops);


--
-- Name: shop_collection_alias_4afcecd3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_collection_alias_4afcecd3 ON public.shop_collection USING btree (alias);


--
-- Name: shop_collection_alias_4afcecd3_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_collection_alias_4afcecd3_like ON public.shop_collection USING btree (alias varchar_pattern_ops);


--
-- Name: shop_collection_slug_e0821450_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_collection_slug_e0821450_like ON public.shop_collection USING btree (slug varchar_pattern_ops);


--
-- Name: shop_produc_id_f21274_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_produc_id_f21274_idx ON public.shop_product USING btree (id, slug);


--
-- Name: shop_product_article_9f5f1242; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_product_article_9f5f1242 ON public.shop_product USING btree (article);


--
-- Name: shop_product_article_9f5f1242_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_product_article_9f5f1242_like ON public.shop_product USING btree (article varchar_pattern_ops);


--
-- Name: shop_product_brand_id_505fec11; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_product_brand_id_505fec11 ON public.shop_product USING btree (brand_id);


--
-- Name: shop_product_categories_id_e0b18cd8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_product_categories_id_e0b18cd8 ON public.shop_product USING btree (categories_id);


--
-- Name: shop_product_collection_id_7ed3c9a3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_product_collection_id_7ed3c9a3 ON public.shop_product USING btree (collection_id);


--
-- Name: shop_product_name_b8d5e94c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_product_name_b8d5e94c ON public.shop_product USING btree (name);


--
-- Name: shop_product_name_b8d5e94c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_product_name_b8d5e94c_like ON public.shop_product USING btree (name varchar_pattern_ops);


--
-- Name: shop_product_name_en_e6bce49e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_product_name_en_e6bce49e ON public.shop_product USING btree (name_en);


--
-- Name: shop_product_name_en_e6bce49e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_product_name_en_e6bce49e_like ON public.shop_product USING btree (name_en varchar_pattern_ops);


--
-- Name: shop_product_name_ru_6e83f9e1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_product_name_ru_6e83f9e1 ON public.shop_product USING btree (name_ru);


--
-- Name: shop_product_name_ru_6e83f9e1_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_product_name_ru_6e83f9e1_like ON public.shop_product USING btree (name_ru varchar_pattern_ops);


--
-- Name: shop_product_product_type_id_1a6738f6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_product_product_type_id_1a6738f6 ON public.shop_product USING btree (product_type_id);


--
-- Name: shop_product_slug_30bd2d5d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_product_slug_30bd2d5d_like ON public.shop_product USING btree (slug varchar_pattern_ops);


--
-- Name: shop_product_subcategories_id_db2b5619; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_product_subcategories_id_db2b5619 ON public.shop_product USING btree (subcategories_id);


--
-- Name: shop_productimg_product_id_1ff00278; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_productimg_product_id_1ff00278 ON public.shop_productimg USING btree (product_id);


--
-- Name: shop_productinstancepropertyvalue_value_9f94f513_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_productinstancepropertyvalue_value_9f94f513_like ON public.shop_value USING btree (value varchar_pattern_ops);


--
-- Name: shop_producttype_alias_21b51e1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_producttype_alias_21b51e1b ON public.shop_producttype USING btree (alias);


--
-- Name: shop_producttype_alias_21b51e1b_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_producttype_alias_21b51e1b_like ON public.shop_producttype USING btree (alias varchar_pattern_ops);


--
-- Name: shop_producttype_alias_en_398f8942; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_producttype_alias_en_398f8942 ON public.shop_producttype USING btree (alias_en);


--
-- Name: shop_producttype_alias_en_398f8942_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_producttype_alias_en_398f8942_like ON public.shop_producttype USING btree (alias_en varchar_pattern_ops);


--
-- Name: shop_producttype_alias_ru_ace97037; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_producttype_alias_ru_ace97037 ON public.shop_producttype USING btree (alias_ru);


--
-- Name: shop_producttype_alias_ru_ace97037_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_producttype_alias_ru_ace97037_like ON public.shop_producttype USING btree (alias_ru varchar_pattern_ops);


--
-- Name: shop_producttype_slug_7939c83e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_producttype_slug_7939c83e_like ON public.shop_producttype USING btree (slug varchar_pattern_ops);


--
-- Name: shop_producttype_subcategories_id_03190897; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_producttype_subcategories_id_03190897 ON public.shop_producttype USING btree (subcategories_id);


--
-- Name: shop_proper_id_0b90ab_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_proper_id_0b90ab_idx ON public.shop_property USING btree (id, slug);


--
-- Name: shop_property_alias_en_a43fd11e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_property_alias_en_a43fd11e ON public.shop_property USING btree (alias_en);


--
-- Name: shop_property_alias_en_a43fd11e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_property_alias_en_a43fd11e_like ON public.shop_property USING btree (alias_en varchar_pattern_ops);


--
-- Name: shop_property_alias_ru_44b29f15; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_property_alias_ru_44b29f15 ON public.shop_property USING btree (alias_ru);


--
-- Name: shop_property_alias_ru_44b29f15_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_property_alias_ru_44b29f15_like ON public.shop_property USING btree (alias_ru varchar_pattern_ops);


--
-- Name: shop_property_name_en_6c73b944_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_property_name_en_6c73b944_like ON public.shop_property USING btree (name_en varchar_pattern_ops);


--
-- Name: shop_property_name_ru_e3af02f4_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_property_name_ru_e3af02f4_like ON public.shop_property USING btree (name_ru varchar_pattern_ops);


--
-- Name: shop_propertytype_alias_9c4ac24a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_propertytype_alias_9c4ac24a ON public.shop_property USING btree (alias);


--
-- Name: shop_propertytype_alias_9c4ac24a_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_propertytype_alias_9c4ac24a_like ON public.shop_property USING btree (alias varchar_pattern_ops);


--
-- Name: shop_propertytype_name_44499ebd_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_propertytype_name_44499ebd_like ON public.shop_property USING btree (name varchar_pattern_ops);


--
-- Name: shop_propertytype_product_type_producttype_id_accff9ce; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_propertytype_product_type_producttype_id_accff9ce ON public.shop_property_product_type USING btree (producttype_id);


--
-- Name: shop_propertytype_product_type_propertytype_id_7be63c6e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_propertytype_product_type_propertytype_id_7be63c6e ON public.shop_property_product_type USING btree (property_id);


--
-- Name: shop_propertytype_slug_890bfe6b_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_propertytype_slug_890bfe6b_like ON public.shop_property USING btree (slug varchar_pattern_ops);


--
-- Name: shop_subcategory_alias_b2a6cd5c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_subcategory_alias_b2a6cd5c ON public.shop_subcategory USING btree (alias);


--
-- Name: shop_subcategory_alias_b2a6cd5c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_subcategory_alias_b2a6cd5c_like ON public.shop_subcategory USING btree (alias varchar_pattern_ops);


--
-- Name: shop_subcategory_alias_en_fa0b97bc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_subcategory_alias_en_fa0b97bc ON public.shop_subcategory USING btree (alias_en);


--
-- Name: shop_subcategory_alias_en_fa0b97bc_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_subcategory_alias_en_fa0b97bc_like ON public.shop_subcategory USING btree (alias_en varchar_pattern_ops);


--
-- Name: shop_subcategory_alias_ru_efaf5315; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_subcategory_alias_ru_efaf5315 ON public.shop_subcategory USING btree (alias_ru);


--
-- Name: shop_subcategory_alias_ru_efaf5315_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_subcategory_alias_ru_efaf5315_like ON public.shop_subcategory USING btree (alias_ru varchar_pattern_ops);


--
-- Name: shop_subcategory_categories_id_e4a1c0a1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_subcategory_categories_id_e4a1c0a1 ON public.shop_subcategory USING btree (categories_id);


--
-- Name: shop_subcategory_slug_8652906b_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_subcategory_slug_8652906b_like ON public.shop_subcategory USING btree (slug varchar_pattern_ops);


--
-- Name: shop_value_id_975930_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_value_id_975930_idx ON public.shop_value USING btree (id, value);


--
-- Name: shop_value_product_id_89368777; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_value_product_id_89368777 ON public.shop_value USING btree (product_id);


--
-- Name: shop_value_properties_id_6e7c367d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_value_properties_id_6e7c367d ON public.shop_value USING btree (properties_id);


--
-- Name: shop_value_value_en_a18a3f62; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_value_value_en_a18a3f62 ON public.shop_value USING btree (value_en);


--
-- Name: shop_value_value_en_a18a3f62_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_value_value_en_a18a3f62_like ON public.shop_value USING btree (value_en varchar_pattern_ops);


--
-- Name: shop_value_value_fd4226f3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_value_value_fd4226f3 ON public.shop_value USING btree (value);


--
-- Name: shop_value_value_ru_3aa20ea2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_value_value_ru_3aa20ea2 ON public.shop_value USING btree (value_ru);


--
-- Name: shop_value_value_ru_3aa20ea2_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_value_value_ru_3aa20ea2_like ON public.shop_value USING btree (value_ru varchar_pattern_ops);


--
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailconfirmation account_emailconfirm_email_address_id_5b7f8c58_fk_account_e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_flatpage_sites django_flatpage_site_flatpage_id_078bbc8b_fk_django_fl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_flatpage_sites
    ADD CONSTRAINT django_flatpage_site_flatpage_id_078bbc8b_fk_django_fl FOREIGN KEY (flatpage_id) REFERENCES public.django_flatpage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_flatpage_sites django_flatpage_sites_site_id_bfd8ea84_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_flatpage_sites
    ADD CONSTRAINT django_flatpage_sites_site_id_bfd8ea84_fk_django_site_id FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: eav_attribute eav_attribute_enum_group_id_47628614_fk_eav_enumgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eav_attribute
    ADD CONSTRAINT eav_attribute_enum_group_id_47628614_fk_eav_enumgroup_id FOREIGN KEY (enum_group_id) REFERENCES public.eav_enumgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: eav_enumgroup_values eav_enumgroup_values_enumgroup_id_2bdd7858_fk_eav_enumgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eav_enumgroup_values
    ADD CONSTRAINT eav_enumgroup_values_enumgroup_id_2bdd7858_fk_eav_enumgroup_id FOREIGN KEY (enumgroup_id) REFERENCES public.eav_enumgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: eav_enumgroup_values eav_enumgroup_values_enumvalue_id_52f83e3a_fk_eav_enumvalue_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eav_enumgroup_values
    ADD CONSTRAINT eav_enumgroup_values_enumvalue_id_52f83e3a_fk_eav_enumvalue_id FOREIGN KEY (enumvalue_id) REFERENCES public.eav_enumvalue(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: eav_value eav_value_attribute_id_6fd472ba_fk_eav_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eav_value
    ADD CONSTRAINT eav_value_attribute_id_6fd472ba_fk_eav_attribute_id FOREIGN KEY (attribute_id) REFERENCES public.eav_attribute(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: eav_value eav_value_entity_ct_id_5cfd530e_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eav_value
    ADD CONSTRAINT eav_value_entity_ct_id_5cfd530e_fk_django_content_type_id FOREIGN KEY (entity_ct_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: eav_value eav_value_generic_value_ct_id_d4681436_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eav_value
    ADD CONSTRAINT eav_value_generic_value_ct_id_d4681436_fk_django_co FOREIGN KEY (generic_value_ct_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: eav_value eav_value_value_enum_id_86e48f74_fk_eav_enumvalue_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eav_value
    ADD CONSTRAINT eav_value_value_enum_id_86e48f74_fk_eav_enumvalue_id FOREIGN KEY (value_enum_id) REFERENCES public.eav_enumvalue(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_order orders_order_coupon_id_5bddb887_fk_coupons_coupon_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_order
    ADD CONSTRAINT orders_order_coupon_id_5bddb887_fk_coupons_coupon_id FOREIGN KEY (coupon_id) REFERENCES public.coupons_coupon(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_orderitem orders_orderitem_order_id_fe61a34d_fk_orders_order_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_orderitem
    ADD CONSTRAINT orders_orderitem_order_id_fe61a34d_fk_orders_order_id FOREIGN KEY (order_id) REFERENCES public.orders_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_orderitem orders_orderitem_product_id_afe4254a_fk_shop_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_orderitem
    ADD CONSTRAINT orders_orderitem_product_id_afe4254a_fk_shop_product_id FOREIGN KEY (product_id) REFERENCES public.shop_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_product shop_product_brand_id_505fec11_fk_shop_brand_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_product
    ADD CONSTRAINT shop_product_brand_id_505fec11_fk_shop_brand_id FOREIGN KEY (brand_id) REFERENCES public.shop_brand(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_product shop_product_categories_id_e0b18cd8_fk_shop_category_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_product
    ADD CONSTRAINT shop_product_categories_id_e0b18cd8_fk_shop_category_id FOREIGN KEY (categories_id) REFERENCES public.shop_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_product shop_product_collection_id_7ed3c9a3_fk_shop_collection_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_product
    ADD CONSTRAINT shop_product_collection_id_7ed3c9a3_fk_shop_collection_id FOREIGN KEY (collection_id) REFERENCES public.shop_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_product shop_product_product_type_id_1a6738f6_fk_shop_producttype_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_product
    ADD CONSTRAINT shop_product_product_type_id_1a6738f6_fk_shop_producttype_id FOREIGN KEY (product_type_id) REFERENCES public.shop_producttype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_product shop_product_subcategories_id_db2b5619_fk_shop_subcategory_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_product
    ADD CONSTRAINT shop_product_subcategories_id_db2b5619_fk_shop_subcategory_id FOREIGN KEY (subcategories_id) REFERENCES public.shop_subcategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_productimg shop_productimg_product_id_1ff00278_fk_shop_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_productimg
    ADD CONSTRAINT shop_productimg_product_id_1ff00278_fk_shop_product_id FOREIGN KEY (product_id) REFERENCES public.shop_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_producttype shop_producttype_subcategories_id_03190897_fk_shop_subc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_producttype
    ADD CONSTRAINT shop_producttype_subcategories_id_03190897_fk_shop_subc FOREIGN KEY (subcategories_id) REFERENCES public.shop_subcategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_property_product_type shop_property_produc_property_id_5384294c_fk_shop_prop; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_property_product_type
    ADD CONSTRAINT shop_property_produc_property_id_5384294c_fk_shop_prop FOREIGN KEY (property_id) REFERENCES public.shop_property(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_property_product_type shop_propertytype_pr_producttype_id_accff9ce_fk_shop_prod; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_property_product_type
    ADD CONSTRAINT shop_propertytype_pr_producttype_id_accff9ce_fk_shop_prod FOREIGN KEY (producttype_id) REFERENCES public.shop_producttype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_subcategory shop_subcategory_categories_id_e4a1c0a1_fk_shop_category_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_subcategory
    ADD CONSTRAINT shop_subcategory_categories_id_e4a1c0a1_fk_shop_category_id FOREIGN KEY (categories_id) REFERENCES public.shop_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_value shop_value_product_id_89368777_fk_shop_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_value
    ADD CONSTRAINT shop_value_product_id_89368777_fk_shop_product_id FOREIGN KEY (product_id) REFERENCES public.shop_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_value shop_value_properties_id_6e7c367d_fk_shop_property_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_value
    ADD CONSTRAINT shop_value_properties_id_6e7c367d_fk_shop_property_id FOREIGN KEY (properties_id) REFERENCES public.shop_property(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

