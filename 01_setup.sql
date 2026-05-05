-- =====================================================
-- DEUTSCH HUB — 01_setup.sql
-- Configurações iniciais e extensões.
-- =====================================================

-- ── Extensões ─────────────────────────────────────
-- Gera UUIDs aleatórios
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- Permite buscas sem acentos (ex: buscar "uber" encontra "über")
CREATE EXTENSION IF NOT EXISTS unaccent;

-- ── Função para updated_at automático ─────────────
CREATE OR REPLACE FUNCTION public.set_updated_at()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$;