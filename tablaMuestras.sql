CREATE TABLE public.muestra (
    id SERIAL,
    id_localidad_plantacion integer NOT NULL,
    id_tipo_fermentador integer,
    id_tipo_secado integer,
    id_calidad_fermentacion integer,
    cantidad_mazorcas integer,
    fecha_obtencion date,
    tiempo_fermentacion numeric(8,2),
    tiempo_secado numeric(8,2),
    humedad_post_secado numeric(8,2),
    peso_promedio numeric(8,2),
    ancho numeric(8,2),
    espesor numeric(8,2),
    longitud numeric(8,2)
);

INSERT INTO public.muestra VALUES (25, 12, 1, 1, 1, 2, '2016-10-10', 6.00, 0.00, 8.00, 1.40, 12.32, 8.19, 21.96);
INSERT INTO public.muestra VALUES (26, 12, 1, 1, 1, 2, '2016-10-10', 5.00, 0.00, 8.00, 1.60, 12.79, 8.24, 22.45);
INSERT INTO public.muestra VALUES (27, 12, 1, 1, 1, 2, NULL, NULL, NULL, NULL, 1.29, 13.80, 9.78, 24.97);
INSERT INTO public.muestra VALUES (28, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.87, 12.82, 9.32, 23.39);