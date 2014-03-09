--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.3
-- Dumped by pg_dump version 9.3.3
-- Started on 2014-03-06 00:50:37 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 181 (class 3079 OID 11764)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2000 (class 0 OID 0)
-- Dependencies: 181
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- TOC entry 194 (class 1255 OID 16395)
-- Name: get_mitglied_kontostand(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION get_mitglied_kontostand(mitglied_id integer) RETURNS money
    LANGUAGE sql
    AS $$ SELECT sum(sparkasse.betrag) AS kontostand
   FROM mitglieder,
    sparkasse
  WHERE
  mitglieder.id = mitglied_id
  and sparkasse.verwendungszweck ~~* (('%'::text || mitglieder.mitgliednr) || '%'::text)
  ;$$;


ALTER FUNCTION public.get_mitglied_kontostand(mitglied_id integer) OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 170 (class 1259 OID 16396)
-- Name: sparkasse; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sparkasse (
    id integer NOT NULL,
    auftragskonto text,
    buchungstag date,
    valutadatum date,
    buchungstext text,
    verwendungszweck text,
    beguenstigter text,
    kontonummer text,
    blz text,
    betrag money,
    waehrung text,
    info text
);


ALTER TABLE public.sparkasse OWNER TO postgres;

--
-- TOC entry 171 (class 1259 OID 16402)
-- Name: Kontostand; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW "Kontostand" AS
 SELECT sum(sparkasse.betrag) AS kontostand
   FROM sparkasse;


ALTER TABLE public."Kontostand" OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 16406)
-- Name: barkasse; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE barkasse (
    id integer NOT NULL,
    mitglied_id integer,
    datum date,
    belegtext text,
    betrag money
);


ALTER TABLE public.barkasse OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 16412)
-- Name: barkasse_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE barkasse_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.barkasse_id_seq OWNER TO postgres;

--
-- TOC entry 2001 (class 0 OID 0)
-- Dependencies: 173
-- Name: barkasse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE barkasse_id_seq OWNED BY barkasse.id;


--
-- TOC entry 174 (class 1259 OID 16414)
-- Name: beitraege; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE beitraege (
    id integer NOT NULL,
    name text,
    gueltig_von date,
    gueltig_bis date,
    beitrag money
);


ALTER TABLE public.beitraege OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 16420)
-- Name: beitraege_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE beitraege_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.beitraege_id_seq OWNER TO postgres;

--
-- TOC entry 2002 (class 0 OID 0)
-- Dependencies: 175
-- Name: beitraege_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE beitraege_id_seq OWNED BY beitraege.id;


--
-- TOC entry 176 (class 1259 OID 16422)
-- Name: mitglied_beitrag; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mitglied_beitrag (
    id integer NOT NULL,
    mitglied_id integer,
    beitrag_id integer
);


ALTER TABLE public.mitglied_beitrag OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 16425)
-- Name: mitglied_beitrag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mitglied_beitrag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mitglied_beitrag_id_seq OWNER TO postgres;

--
-- TOC entry 2003 (class 0 OID 0)
-- Dependencies: 177
-- Name: mitglied_beitrag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mitglied_beitrag_id_seq OWNED BY mitglied_beitrag.id;


--
-- TOC entry 178 (class 1259 OID 16427)
-- Name: mitglieder; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mitglieder (
    id integer NOT NULL,
    typkennung text,
    mitgliednr text,
    anrede text,
    titel text,
    vorname text,
    nachname text,
    firma text,
    abteilung text,
    strasse text,
    plz text,
    ort text,
    reserviert text,
    reserviert2 text,
    land text,
    telefon text,
    telefax text,
    email text,
    kontonr text,
    blz text,
    iban text,
    bic text,
    bankname text,
    sepa_mandatsreferenz text,
    datum_unterschrift text,
    geburtsdatum date,
    eintrittsdatum date,
    austrittsdatum date,
    bemerkung text,
    telefon2 text,
    skype_voip text,
    inhaber text,
    ausgabemedium text,
    adressgruppe text,
    zahlungsbedingung text,
    abrechnung_ueber text,
    ausgabe_sprache text
);


ALTER TABLE public.mitglieder OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 16433)
-- Name: mitglieder_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mitglieder_id_seq
    START WITH 10000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mitglieder_id_seq OWNER TO postgres;

--
-- TOC entry 2004 (class 0 OID 0)
-- Dependencies: 179
-- Name: mitglieder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mitglieder_id_seq OWNED BY mitglieder.id;


--
-- TOC entry 180 (class 1259 OID 16435)
-- Name: sparkasse_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sparkasse_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sparkasse_id_seq OWNER TO postgres;

--
-- TOC entry 2005 (class 0 OID 0)
-- Dependencies: 180
-- Name: sparkasse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sparkasse_id_seq OWNED BY sparkasse.id;


--
-- TOC entry 1870 (class 2604 OID 16437)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY barkasse ALTER COLUMN id SET DEFAULT nextval('barkasse_id_seq'::regclass);


--
-- TOC entry 1871 (class 2604 OID 16438)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY beitraege ALTER COLUMN id SET DEFAULT nextval('beitraege_id_seq'::regclass);


--
-- TOC entry 1872 (class 2604 OID 16439)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mitglied_beitrag ALTER COLUMN id SET DEFAULT nextval('mitglied_beitrag_id_seq'::regclass);


--
-- TOC entry 1873 (class 2604 OID 16440)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mitglieder ALTER COLUMN id SET DEFAULT nextval('mitglieder_id_seq'::regclass);


--
-- TOC entry 1869 (class 2604 OID 16441)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sparkasse ALTER COLUMN id SET DEFAULT nextval('sparkasse_id_seq'::regclass);


--
-- TOC entry 1877 (class 2606 OID 16443)
-- Name: barkasse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY barkasse
    ADD CONSTRAINT barkasse_pkey PRIMARY KEY (id);


--
-- TOC entry 1879 (class 2606 OID 16445)
-- Name: beitraege_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY beitraege
    ADD CONSTRAINT beitraege_pkey PRIMARY KEY (id);


--
-- TOC entry 1881 (class 2606 OID 16447)
-- Name: mitglied_beitrag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mitglied_beitrag
    ADD CONSTRAINT mitglied_beitrag_pkey PRIMARY KEY (id);


--
-- TOC entry 1883 (class 2606 OID 16449)
-- Name: mitglieder_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mitglieder
    ADD CONSTRAINT mitglieder_pkey PRIMARY KEY (id);


--
-- TOC entry 1875 (class 2606 OID 16451)
-- Name: pk_sparkasse; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sparkasse
    ADD CONSTRAINT pk_sparkasse PRIMARY KEY (id);


--
-- TOC entry 1884 (class 2606 OID 16452)
-- Name: mitglied_beitrag_beitrag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mitglied_beitrag
    ADD CONSTRAINT mitglied_beitrag_beitrag_id_fkey FOREIGN KEY (beitrag_id) REFERENCES beitraege(id);


--
-- TOC entry 1999 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2014-03-06 00:50:37 CET

--
-- PostgreSQL database dump complete
--

